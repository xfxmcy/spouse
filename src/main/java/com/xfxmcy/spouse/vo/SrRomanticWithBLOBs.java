package com.xfxmcy.spouse.vo;

public class SrRomanticWithBLOBs extends SrRomantic {
    private String title;

    private String contentfirst;

    private String contentsecond;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContentfirst() {
        return contentfirst;
    }

    public void setContentfirst(String contentfirst) {
        this.contentfirst = contentfirst == null ? null : contentfirst.trim();
    }

    public String getContentsecond() {
        return contentsecond;
    }

    public void setContentsecond(String contentsecond) {
        this.contentsecond = contentsecond == null ? null : contentsecond.trim();
    }
}