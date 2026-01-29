# Format SQL

Format SQL queries using a consistent, readable style.

## SQL Formatting Rules

When formatting SQL queries, apply these rules:

### 1. Keywords
- All SQL keywords UPPERCASE: `SELECT`, `FROM`, `JOIN`, `ON`, `WHERE`, `AND`, `OR`, `ORDER BY`, `GROUP BY`, `HAVING`, `LIMIT`, `INSERT`, `UPDATE`, `DELETE`, `CREATE`, `ALTER`, `DROP`

### 2. Indentation Pattern
```
SELECT column1,
       column2,
       column3
FROM table1
    JOIN table2
        ON (table1.id = table2.foreign_id)
    JOIN table3
        ON (table2.id = table3.foreign_id)
WHERE condition1 = 'value'
    AND condition2 = 'value'
ORDER BY column1
```

### 3. Specific Rules

**SELECT clause:**
- `SELECT` at column 1
- First column on same line as SELECT
- Subsequent columns on new lines, indented to align with first column (7 spaces)

**FROM clause:**
- `FROM` at column 1, on its own line

**JOIN clauses:**
- `JOIN` indented 4 spaces from column 1
- `ON` indented 8 spaces from column 1
- Join conditions wrapped in parentheses

**WHERE clause:**
- `WHERE` at column 1
- `AND`/`OR` conditions indented 4 spaces on new lines

**Other clauses:**
- `GROUP BY`, `ORDER BY`, `HAVING`, `LIMIT` at column 1

### 4. Example

**Before:**
```sql
select companyname, addresstype, addressline1 from customer join customeraddress on customer.customerid = customeraddress.customerid join address on customeraddress.addressid = address.addressid where companyname = 'ACME Corporation'
```

**After:**
```sql
SELECT CompanyName,
       AddressType,
       AddressLine1
FROM Customer
    JOIN CustomerAddress
        ON (Customer.CustomerID = CustomerAddress.CustomerID)
    JOIN Address
        ON (CustomerAddress.AddressID = Address.AddressID)
WHERE CompanyName = 'ACME Corporation'
```

## Usage

When asked to format SQL, apply these rules to produce clean, readable queries. Preserve the original column and table names (including case).
