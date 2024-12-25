#!/bin/bash

# Initialize variables
# List of books and their corresponding prices
book_list=("The Great Gatsby" "1984" "To Kill a Mockingbird" "Moby Dick" "War and Peace")
prices=(10 15 12 20 25)
order_history=()  # Array to store the ordered books
total_cost=0  # Variable to store the total cost of the order

# Function to display available books
display_books() {
    echo "Available Books:"
    for i in "${!book_list[@]}"; do
        echo "$((i + 1)). ${book_list[$i]} - \$${prices[$i]}"
    done
}

# Function to place an order
place_order() {
    echo "Enter the number of the book you want to order (or 0 to finish):"
    while true; do
        read -p "Book number: " book_number  # Prompt the user to input a book number
        if [ "$book_number" -eq 0 ]; then
            break  # Exit the loop if the user inputs 0
        elif [ "$book_number" -ge 1 ] && [ "$book_number" -le ${#book_list[@]} ]; then
            index=$((book_number - 1))  # Calculate the array index for the selected book
            order_history+=("${book_list[$index]}")  # Add the selected book to the order history
            total_cost=$((total_cost + prices[$index]))  # Add the price of the selected book to the total cost
            echo "Added ${book_list[$index]} to your order."
        else
            echo "Invalid selection. Please try again."  # Handle invalid input
        fi
    done
}

# Function to display the order history
display_order_history() {
    if [ ${#order_history[@]} -eq 0 ]; then
        echo "No orders have been placed yet."
    else
        echo "Your Order History:"
        for order in "${order_history[@]}"; do
            echo "- $order"  # Display each book in the order history
        done
        echo "Total Cost: \$${total_cost}"  # Display the total cost of the order
    fi
}

# Main menu loop
while true; do
    echo "\nOnline Book Ordering System"
    echo "1. View available books"
    echo "2. Place an order"
    echo "3. View order history"
    echo "4. Exit"

    read -p "Choose an option: " option  # Prompt the user to choose an option
    case $option in
        1)
            display_books  # Call the function to display available books
            ;;
        2)
            display_books  # Display books before placing an order
            place_order  # Call the function to place an order
            ;;
        3)
            display_order_history  # Call the function to display order history
            ;;
        4)
            echo "Thank you for using the Online Book Ordering System!"  # Exit message
            break  # Exit the loop and end the program
            ;;
        *)
            echo "Invalid option. Please try again."  # Handle invalid menu option
            ;;
    esac

done
