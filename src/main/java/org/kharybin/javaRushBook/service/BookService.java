package org.kharybin.javaRushBook.service;

import org.kharybin.javaRushBook.model.Book;

import java.util.List;

public interface BookService {
    public void addBook(Book book);

    public void updateBook(Book book);

    public void removeBook(long id);

    public void setRead(long id);

    public Book getBookById(long id);

    public List<Book> listBooks();

    public List<Book> searchBooks(long id);

    public Integer getNumberOfPages();

    public List<Book> getBooksPerPage(Integer pageNum);
}
