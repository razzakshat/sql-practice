-- Problem: Higher Salary Than Best Friend
-- Platform: HackerRank
-- Topic: SQL Joins
--
-- Explanation:
-- For each student, we compare their salary with the salary of their best friend.
-- First, we link each student to their best friend using the Friends table.
-- Then, we fetch salaries from the Packages table:
--   - once for the student
--   - once for the best friend
-- After that, we keep only those students whose best friend earns more than them.
-- Finally, we sort the result based on the friend's salary as required.

SELECT s.Name
FROM Students s
JOIN Friends f
    ON s.ID = f.ID
JOIN Packages p1
    ON s.ID = p1.ID
JOIN Packages p2
    ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;
