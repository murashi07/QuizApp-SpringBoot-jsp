package com.quizapp.sixquizapp.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code here
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // Authorization logic here
        chain.doFilter(request, response); // Continue the chain
    }

    @Override
    public void destroy() {
        // Cleanup code here
    }
}
