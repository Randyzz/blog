package com.xiaoji.blog.entity;

import java.io.Serializable;
import java.util.List;

public class PageBean<T> implements Serializable {
    private int currentPage; //当前页数
    private int pageSize; //每页显示的个数
    private long total; //总记录数
    private int start;
    private int end;
    private List<T> resut; //分页查询的结果

    public PageBean() {
    }

    public PageBean(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.start = (currentPage-1)*pageSize;
        this.end = currentPage*pageSize;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", total=" + total +
                ", start=" + start +
                ", end=" + end +
                ", resut=" + resut +
                '}';
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public List<T> getResut() {
        return resut;
    }

    public void setResut(List<T> resut) {
        this.resut = resut;
    }
}
