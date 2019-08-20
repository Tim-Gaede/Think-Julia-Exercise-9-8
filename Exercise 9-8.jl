#-------------------------------------------------------------------------------
function palindrome(number, numDigits)
# ******************Can handle leading zeros************************
    # Break down the number into an array of digits from right to left..........
    digits = []
    remaining = number
    for i = 1 : numDigits
        push!(digits, remaining % 10)
        remaining ÷= 10
    end
    # ..........................................................................

    if remaining > 0
        message = ("numDigits = $numDigits is less than the actual number of\n",
                   " digits for the number = $number.")

        throw(message)
    end

    # Look for a mismatch in digits ....................................
    mismatch_found = false
    left = length(digits)
    right = 1
    while !mismatch_found    &&    left ≥ right
        if digits[left] ≠ digits[right]
            mismatch_found = true
        end

        left  -= 1
        right += 1
    end
    # ..................................................................


    !mismatch_found
end
#-------------------------------------------------------------------------------


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function main()     

    for odometer = 100_000 : 999_996

        num_1st = odometer % 10_000
        num_2nd = (odometer + 1) % 100_000
        num_3rd = ((odometer + 2) ÷ 10) % 10_000
        num_4th = odometer + 3



        if ( palindrome(num_1st, 4) && palindrome(num_2nd, 5) &&
             palindrome(num_3rd, 4) && palindrome(num_4th, 6) )

            println("\n"^4, odometer, " works:\n")
            println(odometer, " last 4")
            println(odometer + 1, " last 5")
            println(odometer + 2, " middle 4")
            println(odometer + 3, " all 6")
        end

    end


    println("\n"^5, "Done!")
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
main()
