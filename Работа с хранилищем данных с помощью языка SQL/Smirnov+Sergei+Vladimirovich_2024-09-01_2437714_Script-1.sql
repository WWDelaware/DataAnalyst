/*Выведите авторов, имеющихся в базе.*/
select *
from author;
/*Найдите всех авторов с инициалами «С. А.». Автор в базе определяется так: И. О. Фамилия*/
select *
from author
where name like "С. А.%";
/*Выведите список книг, выпущенных в издательстве «Мир»*/
SELECT *,
 publisher.name
FROM book, publisher
WHERE (book.publisher_id = publisher.id) AND (publisher.name IN ('Мир', 'МИР'));
/*Выведите количество книг, принадлежащих каждой из категорий. Результат отсортировать по возрастанию.*/
SELECT category.title AS "category", count(book.title) AS "amount"
FROM category, book
WHERE (book.category_id = category.id)
GROUP BY category.title
ORDER BY amount asc;
-- Выведите количество книг, выпущенных в каждом издательстве. В итоговом списке оставьте только те издательства, которые выпустили 3 и более книг. Результат отсортировать по убыванию
SELECT *
FROM (SELECT publisher.name AS "publisher", count(book.title) AS "amount"
		FROM publisher, book
		WHERE (book.publisher_id = publisher.id)
		GROUP BY publisher.name
		ORDER BY amount DESC)
WHERE amount >= 3;
-- Выведите список книг, автором которых являлся «С. А. Айвазян».
SELECT *
FROM book, author, authorbook
WHERE (book.id = authorbook.book_id) AND (authorbook.author_id = author.id) AND (author.name IN ('С. А. Айвазян'));
-- В каких издательствах и сколько выпускались книги за авторством «С. А. Айвазян». Результат отсортировать по убыванию
SELECT publisher.name, count (*)
FROM publisher, book, author, authorbook
WHERE (book.publisher_id = publisher.id) AND (book.id = authorbook.book_id) AND (authorbook.author_id = author.id) AND (author.name IN ('С. А. Айвазян'))
GROUP BY publisher.name;
