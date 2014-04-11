package com.xfxmcy.spouse.vo;

public class SYHome {
    private String id;

    private String name;

    private String path;

    private String type;

    private Integer preCount;

    private String isBig;

    private Integer phOrder;

    private String descri;

    private String isSmall;

    private String showLocation;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getPreCount() {
        return preCount;
    }

    public void setPreCount(Integer preCount) {
        this.preCount = preCount;
    }

    public String getIsBig() {
        return isBig;
    }

    public void setIsBig(String isBig) {
        this.isBig = isBig == null ? null : isBig.trim();
    }

    public Integer getPhOrder() {
        return phOrder;
    }

    public void setPhOrder(Integer phOrder) {
        this.phOrder = phOrder;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri == null ? null : descri.trim();
    }

    public String getIsSmall() {
        return isSmall;
    }

    public void setIsSmall(String isSmall) {
        this.isSmall = isSmall == null ? null : isSmall.trim();
    }

    public String getShowLocation() {
        return showLocation;
    }

    public void setShowLocation(String showLocation) {
        this.showLocation = showLocation == null ? null : showLocation.trim();
    }
}