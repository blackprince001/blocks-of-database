-- tables represent relations on relational databases.
-- columns in the tables represent the attributes of the relation
-- tupes represents the row of each data entity that can be found a table/relation.

-- other non-relational databases utilize collections, fields and document
-- collections are analogous to tables
-- fields represent columns in a non-relational database
-- document refers to a row in a column in relational databases. 
    --- documents are encapsulated by braces as part of the non-relational database collection

-- All SQL queries will contain some combination of these clauses.
-- If you remember nothing else, remember this order!

SELECT -- columns to display
FROM -- table(s) to pull from
WHERE -- filter rows
GROUP BY -- split rows into groups
HAVING -- filter grouped rows
ORDER BY -- columns to sort

-- The classic mnemonic to remember the order of the clauses is:
    -- Sweaty feet will give horrible odors.

-- If you don’t want to think about sweaty feet each time you write
-- a query, here’s one that I made up:
    -- Start Fridays with grandma’s homemade oatmeal.

-- Order of Execution

-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT
-- 6. ORDER BY

-- 1. Gathers all of the data with the FROM
-- 2. Filters rows of data with the WHERE
-- 3. Groups rows together with the GROUP BY
-- 4. Filters grouped rows with the HAVING
-- 5. Specifies columns to display with the SELECT
-- 6. Rearranges the results with the ORDER BY