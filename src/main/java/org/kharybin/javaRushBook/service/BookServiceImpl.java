package org.kharybin.javaRushBook.service;

import org.kharybin.javaRushBook.dao.BookDao;
import org.kharybin.javaRushBook.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void setRead(long id) {
        this.bookDao.setRead(id);
    }

    @Override
    @Transactional
    public void removeBook(long id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(long id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }

    @Override
    @Transactional
    public List<Book> searchBooks(long id) {
        return this.bookDao.searchBooks(id);
    }

    @Override
    @Transactional
    public Integer getNumberOfPages() {
        return this.bookDao.getNumberOfPages();
    }

    @Override
    @Transactional
    public List<Book> getBooksPerPage(Integer pageNum) {
        return this.bookDao.getBooksPerPage(pageNum);
    }
}
