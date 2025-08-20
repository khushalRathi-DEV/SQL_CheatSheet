-- Window functions let you perform calculations across rows related to the current row — without collapsing them into a single result (like GROUP BY does).

-- RANK() vs DENSE_RANK() vs ROW_NUMBER()

-- They all assign ranking numbers to rows within a partition (or entire table), based on some ordering, but they behave slightly differently when ties (duplicate values) occur.

-- Let’s say you have this data:

| id | name  | salary |
| -- | ----- | ------ |
| 1  | Alice | 4000   |
| 2  | Bob   | 3000   |
| 3  | Carol | 3000   |
| 4  | Dave  | 2000   |
| 5  | Eve   | 1000   |


SELECT name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

Output:

| name  | salary | rank | dense\_rank | row\_num |
| ----- | ------ | ---- | ----------- | -------- |
| Alice | 4000   | 1    | 1           | 1        |
| Bob   | 3000   | 2    | 2           | 2        |
| Carol | 3000   | 2    | 2           | 3        |
| Dave  | 2000   | 4    | 3           | 4        |
| Eve   | 1000   | 5    | 4           | 5        |

What Is PARTITION BY?

Think of PARTITION BY as grouping data into categories, but without collapsing rows like GROUP BY does.

It tells the window function:
👉 “Apply your calculation within each group defined by this column.”

Example Scenario
Table: sales
| id | employee | region | amount |
| -- | -------- | ------ | ------ |
| 1  | Alice    | East   | 100    |
| 2  | Bob      | East   | 200    |
| 3  | Carol    | West   | 150    |
| 4  | Dave     | West   | 300    |
| 5  | Eve      | East   | 250    |
| 6  | Frank    | West   | 100    |

Goal: Rank employees within each region based on their sales (amount)

SELECT employee, region, amount,
      RANK() OVER (PARTITION BY region ORDER BY amount DESC) AS rank
FROM sales;

Output:
| employee | region | amount | region\_rank |
| -------- | ------ | ------ | ------------ |
| Eve      | East   | 250    | 1            |
| Bob      | East   | 200    | 2            |
| Alice    | East   | 100    | 3            |
| Dave     | West   | 300    | 1            |
| Carol    | West   | 150    | 2            |
| Frank    | West   | 100    | 3            |
