package util;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class PageHelper<T>{
    public Page<T> listToPage(List<T> list, int total, Pageable pageable){
        return new Page<T>() {
            @Override
            public List<T> getContent() {
                return list;
            }

            @Override
            public int getNumber() {
                return pageable.getPageNum();
            }

            @Override
            public int getPageSize() {
                return pageable.getPageSize();
            }

            @Override
            public int getTotalPages() {
                return (int) Math.ceil((double)total/pageable.getPageSize());
            }

            @Override
            public long getTotalElements() {
                return total;
            }

            @Override
            public boolean hasNext() {
                return pageable.getPageNum() < getTotalPages();
            }

            @Override
            public boolean hasPrevious() {
                return pageable.getPageNum() > 1;
            }
        };
    }

    public static Pageable PageRequest(HttpServletRequest request){
        Pageable page = new Pageable();

        String pageNum = request.getParameter("n");
        if(pageNum != null){
            page.setPageNum(Integer.parseInt(pageNum));
        }

        String pageSize = request.getParameter("s");
        if(pageSize != null){
            page.setPageSize(Integer.parseInt(pageSize));
        }
        return page;
    }

}
