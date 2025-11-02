# Plants_MySQL
<img width="1019" height="994" alt="image" src="https://github.com/user-attachments/assets/62efda28-b16c-428d-9582-fd2a1be42eb1" />
#  Project Description

The **Plant Taxonomy Database** is a MySQL-based project designed to organize and manage botanical information.  
It models the hierarchical classification of plants — from *class* to *species* — and includes user interaction features such as comments, images, and viewed species.

The database consists of several interconnected tables that represent both the biological taxonomy and user activities.  
Each table is linked through **foreign keys** and maintains referential integrity using `ON DELETE CASCADE`.



#  Concept Overview

- **Class → Family → Genus → Species** – hierarchical plant classification  
- **Images** – stores image paths for each plant species  
- **Comments** – allows users to leave feedback or descriptions about species  
- **Viewed** – records when a user views a specific plant species  
- **User** – stores basic user information (username, email)

This structure enables users to browse plant data, view images, leave comments, and track interactions.



# Technical Highlights

- Implemented with **MySQL**  
- Uses **primary** and **foreign keys** for relationships  
- Includes examples of:
  - `INNER JOIN`, `LEFT JOIN`, and nested `SELECT` queries  
  - Trigger for automatic user welcome messages  
  - Stored procedure with a cursor to calculate view counts per user  
- Ensures data consistency with `ON DELETE CASCADE` constraints  


# Educational Purpose

This project demonstrates fundamental **database design principles**, including:
- **Entity–Relationship modeling (ER diagram)**
- **Normalization** and relational structure
- Practical **SQL query writing**
- Implementation of **triggers** and **stored procedures**
