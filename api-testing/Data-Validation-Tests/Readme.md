**API Testing & Data Validation Collection**

*   **Tools:** Postman, Newman (CLI), JavaScript.
    
*   **Test Scenarios:** I implemented **Contract Testing** to ensure response schemas remain consistent, and **Functional Testing** to validate that calculated fields (like total prices or discounts) are mathematically correct before they reach the UI.
    
*   **Automation:** These tests are designed to run in a CI/CD pipeline using **Newman**, providing immediate feedback on every build.
