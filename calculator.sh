#!/bin/bash

# Function to calculate factorial
factorial() {
    local n=$1
    local result=1
    for (( i=1; i<=n; i++ )); do
        result=$(( result * i ))
    done
    echo $result
}

# Function to perform calculations based on the operand
calculate() {
    local operand=$1
    local num1=$2
    local num2=$3
    
    case $operand in
        +)
            echo "$num1 + $num2 = $(( num1 + num2 ))"
            ;;
        -)
            echo "$num1 - $num2 = $(( num1 - num2 ))"
            ;;
        \*)
            echo "$num1 * $num2 = $(( num1 * num2 ))"
            ;;
        /)
            if [ $num2 -ne 0 ]; then
                echo "$num1 / $num2 = $(( num1 / num2 ))"
            else
                echo "Error: Division by zero is not allowed."
            fi
            ;;
        %)
            echo "$num1 % $num2 = $(( num1 % num2 ))"
            ;;
        !)
            if [ $num1 -ge 0 ]; then
                echo "$num1! = $(factorial $num1)"
            else
                echo "Error: Factorial is not defined for negative numbers."
            fi
            ;;
        *)
            echo "Error: Invalid operand."
            ;;
    esac
}

# Main script
echo "Enter the operand (+, -, *, /, %, !):"
read operand

case $operand in
    +|-|\*|/|%)
        echo "Enter the first number:"
        read num1
        echo "Enter the second number:"
        read num2
        calculate $operand $num1 $num2
        ;;
    !)
        echo "Enter the number for factorial:"
        read num1
        calculate $operand $num1
        ;;
    *)
        echo "Error: Invalid operand."
        ;;
esac
