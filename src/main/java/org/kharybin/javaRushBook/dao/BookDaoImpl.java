package org.kharybin.javaRushBook.dao;

import org.kharybin.javaRushBook.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book successfully saved. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully update. Book details: " + book);
    }

    @Override
    public void setRead(long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);
        if (!book.isRead()) {
            book.setRead(true);
            session.update(book);
            logger.info("Book is fully read now. Book details: " + book);
        }
        else logger.info("Book was already read, nothing changed");
    }

    @Override
    public void removeBook(long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);

        if(book!=null){
            session.delete(book);
        }
        logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public Book getBookById(long id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, id);
        logger.info("Book successfully loaded. Book details: " + book);

        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();

        for(Book book: bookList){
            logger.info("Book list: " + book);
        }

        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> searchBooks(long id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book where id = " + id).list();

        for(Book book: bookList){
            logger.info("Book list: " + book);
        }

        return bookList;
    }

    @Override
    public Integer getNumberOfPages() {
        Integer maxPageNumber = listBooks().size()/10;
        if (listBooks().size()%10 != 0) maxPageNumber++;
        return  maxPageNumber;
    }

    @Override
    public List<Book> getBooksPerPage(Integer pageNum) {
        List<Book> books = new ArrayList<Book>();
        if (pageNum > getNumberOfPages()) pageNum = getNumberOfPages();
        Integer startRecordd = (pageNum * 10) - 10;
        Integer lastRecord = pageNum*10;
        if (lastRecord > listBooks().size()) lastRecord = listBooks().size();
        for (int i = startRecordd; i < lastRecord; i++) {
            books.add(listBooks().get(i));
        }
        return books;
    }
}
