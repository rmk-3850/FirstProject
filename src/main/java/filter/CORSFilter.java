package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class CORSFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		
		//서버에 대한 필터
		httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
		//요청방식에 대한 필터
		httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
		//헤더에 대한 필터
		httpServletResponse.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
		
		chain.doFilter(request, response);
	}
	
}





























