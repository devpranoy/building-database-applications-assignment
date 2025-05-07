package com.example.demo.config;

import com.example.demo.entity.Author;
import com.example.demo.entity.Book;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;

    @Override
    public void run(String... args) {
        // Create authors
        List<Author> authors = Arrays.asList(
            createAuthor("J.K. Rowling", "jk.rowling@email.com", "British author best known for the Harry Potter series"),
            createAuthor("George R.R. Martin", "grrm@email.com", "American novelist and short story writer"),
            createAuthor("Stephen King", "stephen.king@email.com", "American author of horror and supernatural fiction"),
            createAuthor("Agatha Christie", "agatha.christie@email.com", "English writer known for her detective novels"),
            createAuthor("J.R.R. Tolkien", "tolkien@email.com", "English writer and philologist"),
            createAuthor("Jane Austen", "jane.austen@email.com", "English novelist known for romantic fiction"),
            createAuthor("Ernest Hemingway", "hemingway@email.com", "American novelist and short story writer"),
            createAuthor("Virginia Woolf", "woolf@email.com", "English writer and modernist"),
            createAuthor("Charles Dickens", "dickens@email.com", "English writer and social critic"),
            createAuthor("Mark Twain", "twain@email.com", "American writer and humorist")
        );
        authorRepository.saveAll(authors);

        // Create books
        List<Book> books = Arrays.asList(
            createBook("Harry Potter and the Philosopher's Stone", "978-0747532743", "The first book in the Harry Potter series", new BigDecimal("19.99"), LocalDate.of(1997, 6, 26), authors.get(0)),
            createBook("A Game of Thrones", "978-0553103540", "The first book in A Song of Ice and Fire series", new BigDecimal("24.99"), LocalDate.of(1996, 8, 1), authors.get(1)),
            createBook("The Shining", "978-0385121675", "A horror novel by Stephen King", new BigDecimal("14.99"), LocalDate.of(1977, 1, 28), authors.get(2)),
            createBook("Murder on the Orient Express", "978-0062073495", "A detective novel by Agatha Christie", new BigDecimal("12.99"), LocalDate.of(1934, 1, 1), authors.get(3)),
            createBook("The Hobbit", "978-0547928227", "A fantasy novel by J.R.R. Tolkien", new BigDecimal("16.99"), LocalDate.of(1937, 9, 21), authors.get(4)),
            createBook("Pride and Prejudice", "978-0141439518", "A romantic novel by Jane Austen", new BigDecimal("9.99"), LocalDate.of(1813, 1, 28), authors.get(5)),
            createBook("The Old Man and the Sea", "978-0684801223", "A novel by Ernest Hemingway", new BigDecimal("11.99"), LocalDate.of(1952, 9, 1), authors.get(6)),
            createBook("Mrs. Dalloway", "978-0156628709", "A novel by Virginia Woolf", new BigDecimal("13.99"), LocalDate.of(1925, 5, 14), authors.get(7)),
            createBook("Great Expectations", "978-0141439563", "A novel by Charles Dickens", new BigDecimal("10.99"), LocalDate.of(1861, 1, 1), authors.get(8)),
            createBook("The Adventures of Huckleberry Finn", "978-0142437179", "A novel by Mark Twain", new BigDecimal("8.99"), LocalDate.of(1884, 12, 10), authors.get(9))
        );
        bookRepository.saveAll(books);
    }

    private Author createAuthor(String name, String email, String biography) {
        Author author = new Author();
        author.setName(name);
        author.setEmail(email);
        author.setBiography(biography);
        return author;
    }

    private Book createBook(String title, String isbn, String description, BigDecimal price, LocalDate publicationDate, Author author) {
        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setDescription(description);
        book.setPrice(price);
        book.setPublicationDate(publicationDate);
        book.setAuthor(author);
        return book;
    }
} 