package com.netgrains.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.SessionFactory;
import org.hibernate.StaleObjectStateException;

import com.netgrains.util.HibernateUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HibernateSessionRequestFilter implements Filter {
	 
    private SessionFactory sf;
    final Logger logger = LoggerFactory.getLogger(HibernateSessionRequestFilter.class);
 
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
 
        try {
            logger.debug("Starting a database transaction");

            sf.getCurrentSession().beginTransaction();
 
            // Call the next filter (continue request processing)
            chain.doFilter(request, response);
 
            // Commit and cleanup
            logger.debug("Committing the database transaction");
            sf.getCurrentSession().getTransaction().commit();
 
        } catch (StaleObjectStateException staleEx) {
            logger.error("This interceptor does not implement optimistic concurrency control!");
            logger.error("Your application will not work until you add compensation actions!");
            // Rollback, close everything, possibly compensate for any permanent changes
            // during the conversation, and finally restart business conversation. Maybe
            // give the user of the application a chance to merge some of his work with
            // fresh data... what you do here depends on your applications design.
            throw staleEx;
        } catch (Throwable ex) {
            // Rollback only
            ex.printStackTrace();
            try {
                if (sf.getCurrentSession().getTransaction().isActive()) {
                    logger.debug("Trying to rollback database transaction after exception");
                    sf.getCurrentSession().getTransaction().rollback();
                }
            } catch (Throwable rbEx) {
                logger.error("Could not rollback transaction after exception!", rbEx);
            }
 
            // Let others handle it... maybe another interceptor for exceptions?
            throw new ServletException(ex);
        }
    }
 
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.debug("Initializing filter...");
        logger.debug("Obtaining SessionFactory from static HibernateUtil singleton");
        sf = HibernateUtil.getSessionFactory();
    }
 
    public void destroy() {}
 
}