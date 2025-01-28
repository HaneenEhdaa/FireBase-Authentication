# Shopping App Using Firebase Authentication

This project is a Flutter-based shopping application that implements user authentication using **Firebase Authentication**. It features a **Sign-Up Page**, **Login Page**, and a **Shopping Screen** with essential functionalities to create and authenticate user accounts.


## Problem Statement

**Title:**  Add Firebase authentication for the shopping app.



## Features

### 1. **Login Page**
- **Email Field**:
  - Validates the presence of `@`.
  - Displays a snack bar with an error message for invalid input.
- **Password Field**:
  - Validates the input length (minimum 6 characters).
  - Displays a snack bar with an error message for invalid input.
- **Login Button**:
  - Authenticates the user using **Firebase Authentication**.
  - Navigates to the **Shopping Screen** if login is successful.
  - Displays an error snack bar if login fails.
- **Sign-Up Button**:
  - Redirects users to the **Sign-Up Page** if they don’t have an account.



### 2. **Sign-Up Page**
- **Full Name Field**:
  - Validates that the first letter is capitalized.
  - Displays a snack bar with an error message if validation fails.
- **Email Field**:
  - Validates that the input contains `@`.
  - Displays a snack bar with an error message if validation fails.
- **Password Field**:
  - Validates that the password has at least 6 characters.
  - Displays a snack bar with an error message if validation fails.
- **Confirm Password Field**:
  - Validates that it matches the password field.
  - Displays a snack bar with an error message if validation fails.
- **Sign-Up Button**:
  - Shows a dialog with the message "Account created successfully" if all fields are validated.
  - Navigate to the **Shopping Screen** when the **Close** button in the dialog is clicked.




### 3. **Shopping Screen**
- Displays two sections:
  1. **Product Grid**:
     - Shows a grid layout of products.
  2. **Hot Offers**:
     - Displays a horizontal list of special offers.
- Each product has an **Add to Cart** button:
  - Displays a snack bar message: "Your item added to the cart✨".





## Demo
https://github.com/user-attachments/assets/f8e11236-44b9-46f0-a340-b340e098254d
