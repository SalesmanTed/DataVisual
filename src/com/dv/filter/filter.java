package com.dv.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class filter implements Filter{

 public void destroy() {
 }

 public void doFilter(ServletRequest request, ServletResponse response,
  FilterChain chain) throws IOException, ServletException {
  request.setCharacterEncoding("utf-8");
  chain.doFilter(request, response);
 }

 public void init(FilterConfig arg0) throws ServletException {
 }

}
