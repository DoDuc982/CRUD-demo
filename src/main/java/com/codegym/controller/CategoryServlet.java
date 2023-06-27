package com.codegym.controller;

import com.codegym.dao.Category.CategoryDao;
import com.codegym.dao.Product.ProductDao;
import com.codegym.model.Category;
import com.codegym.model.Product;
import com.codegym.service.Category.CategoryService;
import com.codegym.service.Category.ICategoryService;
import com.codegym.service.Product.IProductService;
import com.codegym.service.Product.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {
    private final ICategoryService categoryService;
    private final IProductService productService;
    public CategoryServlet(){
        this.productService = new ProductService(new ProductDao());
        this.categoryService = new CategoryService(new CategoryDao());
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "delete" -> showDeleteCategory(req, resp);
            case "create" -> showCreateForm(req, resp);

            case "view" -> showListByCategoryId(req, resp);
            default -> showListCategory(req, resp);
        }
    }

    private static void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/category/create.jsp");
        dispatcher.forward(req, resp);
    }

    private void showDeleteCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        req.setAttribute("category", category);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/category/delete.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showListByCategoryId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        List<Product> products = productService.findAllProductByCategory(categoryId);
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/category/view.jsp");
        dispatcher.forward(req, resp);
    }

    private void showListCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/category/list.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete" -> deleteCategory(req, resp);
            case "create" -> createCategory(req, resp);
        }
    }

    private void createCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        Category category = new Category(name);
        categoryService.create(category);
        resp.sendRedirect("/category");
    }

    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        categoryService.deleteById(id);
        resp.sendRedirect("/category");
    }
}
