package common;

public class PathNRedirect {

    private String path; //경로
    private boolean isRedirect;  // 리다이렉트 여부.

    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public boolean isRedirect() {
        return isRedirect;
    }
    public void setRedirect(boolean isRedirect) { // Redirect 여부를 묻는 메소드 true: forward | false: redirect
        this.isRedirect = isRedirect; 
    }

}