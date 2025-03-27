### 1. What is PostgreSQL?

PostgreSQL একটি RDMS(Relational Database Management System)। এটি SQL Data নিয়ে কাজ করে।

### 2. What is the purpose of a database schema in PostgreSQL?

Schema কে একটা Structure এর সাথে তুলনা করা যেতে পারে। মানে একটা Database এর table, function, procedure কেমন হবে তার Structure-ই Schema। এটি ব্যবহার করলে data insertion এর সময় যদি আমরা ভুল data দিয়ে দেই তাহলে insert করতে দিবেনা, error দেখাবে।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary Key হল একটা টেবিলের unique identifiers। এটি কখনোই duplicate হতে পারবেনা। আর এই Primary Key যদি আমরা অন্য কোন Table এ Reference এর জন্য ব্যবহার করি তাহলে তা হবে Foreign Key। Foreign Key duplicate হতে পারবে। এই Foreign Key মূলত একটা টেবিলের সাথে আরেকটা টেবিলের connection তৈরি করতে ব্যবহার করা হয়।

### 4.What is the difference between the VARCHAR and CHAR data types?

CHAR এবং VARCHAR দুইটাই ব্যবহার করা হয় String type data সংরক্ষণের জন্য। এই দুটির মধ্যে প্রধান পার্থক্য হচ্ছে CHAR Fixed length নিয়ে কাজ করে, মানে যদি আমি CHAR(10) ব্যবহার করে 3 characters এর data রাখি তাও ঐ data এর জন্য 10 characters এর জায়গা-ই ব্যবহার হবে। বাকি 7 characters এর জায়গা খালি থাকলেও ওইটা filled-ই ধরে নিবে database।

অন্যদিকে VARCHAR(10) ব্যবহার করে 3 characters এর data রাখলে database এখানে 3 characters এর জায়গা-ই assign করবে। বেশি করবেনা।

### 5. Explain the purpose of the WHERE clause in a SELECT statement.

SELECT statement এর মধ্যে WHERE সাধারনত কোন শর্ত বোঝাতে ব্যবহার করা হয়। WHERE এ যেই শর্ত দেওয়া থাকবে ঐ শর্ত যেসব data পূরণ করবে সেইসব data-ই আমাদের কাছে output হিসাবে আসবে।

### 6. What are the LIMIT and OFFSET clauses used for?

LIMIT হল আমরা কতগুলো data দেখতে চাচ্ছি তা set করে দেওয়ার জন্য ব্যবহার করা হয়। আর OFFSET ব্যবহার করা হয় আমরা কতগুলো data বাদ দিয়ে বা skip করে তারপরের data-গুলো দেখতে চাচ্ছি তা set করার জন্য।

### 7. How can you modify data using UPDATE statements?

UPDATE statement এর structure নিচে দেওয়া হলঃ  
`UPDATE table_name`  
`SET column = value`  
`WHERE condition`  
এখানে UPDATE এর পরে আমাদের Table এর নাম দিতে হবে যেই Table এর data আমরা update করতে চাই।  
SET এর পরে আমাদের বলে দিতে হবে যে আমরা কোন data নতুন করে set করতে চাই।  
আর সব শেষে WHERE এর মধ্যে বলে দিতে হবে আমাদের condition-টা, যেই condition এর উপরে ভিত্তি করে আমাদের data update হবে।

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN ব্যবহার করা হয় Multiple Table কে connect করতে। এটা ব্যবহার করার মাধ্যমে অনেক জটিল জটিল queries আমরা সহজেই করতে পারি। আর আমরা যতগুলো Table Connect করব তাদের সব column access করতে পারি।

### 9. Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY সাধারণত আমরা অনেকগুলো row-তে একই type এর data আছে এমন জায়গাতে ব্যবহার করতে পারি। এটা ব্যবহার করার মাধ্যমে আমরা ঐ একই data এর একটা group পাই, আর ঐ group এর উপর base করে আমরা aggregation operation যেমন COUNT(), SUM() ইত্যাদি চালাতে পারি।

### 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

COUNT() aggregate function ব্যবহার করে আমরা কতগুলো data আছে তা জানতে পারি।  
`SELECT COUNT(*) FROM orders;` ব্যবহার করে আমরা জানতে পারি orders table-এ মোট কতগুলো data আছে।  
SUM() aggregate function ব্যবহার করে আমরা জানতে পারি একটা column এর সবগুলো data এর যোগফল পেতে পারি। এক্ষেত্রে ঐ data গুলো number হওয়া লাগবে।  
`SELECT SUM(price) FROM books;` ব্যবহার করে আমরা books table এর price এর যোগফল জানতে পারি।  
AVG() aggregate function ব্যবহার করে আমরা জানতে পারি একটা column এর সবগুলো data এর গড় পেতে পারি। এক্ষেত্রে ঐ data গুলো number হওয়া লাগবে।  
`SELECT AVG(price) FROM books;` ব্যবহার করে আমরা books table এর price এর গড় জানতে পারি।
