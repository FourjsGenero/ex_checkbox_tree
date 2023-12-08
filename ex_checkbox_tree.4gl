IMPORT util
DEFINE arr DYNAMIC ARRAY OF RECORD
    parentid INTEGER,
    id INTEGER,
    name STRING,
    flag BOOLEAN,
    checkbox_as_image STRING
END RECORD
DEFINE arr_idx INTEGER

MAIN
    WHENEVER ANY ERROR STOP
    DEFER INTERRUPT
    DEFER QUIT
    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP
    
    CLOSE WINDOW SCREEN
    CALL ui.Interface.loadStyles("ex_checkbox_tree.4st")

    CALL populate()

    OPEN WINDOW w WITH FORM "ex_checkbox_tree" ATTRIBUTES(TEXT="Example")

    DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED, DOUBLECLICK=dummy) -- use DOUBLECLICK to avoid unintentional double-click
        BEFORE DISPLAY
            FOR arr_idx = 1 TO arr.getLength()
                LET arr[arr_idx].checkbox_as_image = checkbox_as_image(arr[arr_idx].flag)
            END FOR

        ON ACTION toggle --respond to click in image
            IF arr[arr_curr()].flag IS NOT NULL THEN
                LET arr[arr_curr()].flag = NOT arr[arr_curr()].flag  -- change variable value
                LET arr[arr_curr()].checkbox_as_image = checkbox_as_image(arr[arr_curr()].flag) -- change image value
            END IF

            -- Potential enhancement, consider if toggle on parent should chnage all child nodes
    END DISPLAY
END MAIN

FUNCTION checkbox_as_image(value BOOLEAN)
    RETURN IIF(value IS NULL, NULL, IIF(value, "fa-check-square-o ","fa-square-o"))
END FUNCTION

FUNCTION populate()
DEFINE i, j INTEGER
DEFINE j_parent, j_count INTEGER
DEFINE arr_idx INTEGER

    LET arr_idx = 0
    
    FOR i = 1 TO 4
        LET arr_idx = arr_idx + 1
        LET arr[arr_idx].parentid = NULL
        LET arr[arr_idx].id = arr_idx
        CASE i
            WHEN 1 LET arr[arr_idx].name = "North"
            WHEN 2 LET arr[arr_idx].name = "East"
            WHEN 3 LET arr[arr_idx].name = "West"
            WHEN 4 LET arr[arr_idx].name = "South"
        END CASE
        LET arr[arr_idx].flag= NULL

        LET j_parent = arr_idx
        LET j_count  = util.Math.rand(8)+3
        FOR j = 1 TO j_count
            LET arr_idx = arr_idx + 1
            LET arr[arr_idx].parentid = j_parent
            LET arr[arr_idx].id= arr_idx
            LET arr[arr_idx].name = ASCII(util.Math.rand(26)+65), ASCII(util.Math.rand(26)+97),ASCII(util.Math.rand(26)+97), ASCII(util.Math.rand(26)+97),ASCII(util.Math.rand(26)+97)
            LET arr[arr_idx].flag = (util.Math.rand(2)==0)
        END FOR
    END FOR
END FUNCTION

