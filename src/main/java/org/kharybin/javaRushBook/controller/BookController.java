package org.kharybin.javaRushBook.controller;

import org.kharybin.javaRushBook.model.Book;
import org.kharybin.javaRushBook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(Model model, @RequestParam(value = "id", required = false)Integer id,
                            @RequestParam(value = "page", required = false) Integer page) {
        if (id == null || id == 0) {
            //model.addAttribute("listBooks", this.bookService.listBooks());
            if (page == null || page < 1){
                page = 1;
            }
            if (page > this.bookService.getNumberOfPages()) page = this.bookService.getNumberOfPages();
            model.addAttribute("listBooks", this.bookService.getBooksPerPage(page));
        }
        else {
            model.addAttribute("listBooks", this.bookService.searchBooks(id));
        }

        int startpage = (int) (page - 5 > 0?page - 5:1);
        int endpage = this.bookService.getNumberOfPages();

        model.addAttribute("startpage",startpage);
        model.addAttribute("endpage",endpage);
        model.addAttribute("book", new Book());
        return "books";
    }

    /*@RequestMapping(value = "books/search", method = RequestMethod.GET)
    public String findBooks(Model model, @ModelAttribute("searchBook")Book searchBook){
        model.addAttribute("book", new Book());
        List<Book> books = this.bookService.listBooks();
        Set<Book> booksToShow = new HashSet<Book>();
        if (searchBook != null && searchBook.getTitle()!=null && !searchBook.getTitle().equals("")) {
            for (Book b : books) {
                if (b.getTitle().contains(searchBook.getTitle())) booksToShow.add(b);
            }
            model.addAttribute("listBooks", booksToShow);
        }
        else model.addAttribute("listBooks", books);
        model.addAttribute("searchParam", searchBook);
        return "books";
    }*/

    @RequestMapping(value = "/search/", method = RequestMethod.GET)
    public String search(@RequestParam("id") int id, Model model) {
        model.addAttribute("listBooks", this.bookService.searchBooks(id));
        model.addAttribute("book", new Book());
        return "redirect:/books/?id=" + id;
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            this.bookService.addBook(book);
        } else {
            this.bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("/setRead/{id}")
    public String setReadBook(@PathVariable("id") int id) {
        this.bookService.setRead(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "books";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));

        return "bookdata";
    }
}
