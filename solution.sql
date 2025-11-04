--Challenge 1 - Who Have Published What At Where?

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	titles.title AS "TITLE",
	publishers.pub_name AS "PUBLISHER",
	COUNT(titles.title_id) AS "TITLE COUNT"
FROM authors, titles, publishers, titleauthor
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == titles.title_id AND
	titles.pub_id == publishers.pub_id
GROUP BY titles.title;


-- Challenge 3 - Best Selling Authors

SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	SUM(sales.qty) AS "TOTAL"
FROM authors, sales, titleauthor
WHERE
	authors.au_id == titleauthor.au_id AND
	titleauthor.title_id == sales.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC
LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking


SELECT
	authors.au_id AS "AUTHOR ID",
	authors.au_lname AS "LAST NAME",
	authors.au_fname AS "FIRST NAME",
	COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY "AUTHOR ID"
ORDER BY "TOTAL" DESC
LIMIT 23;

