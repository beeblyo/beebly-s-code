package common;

public class PathNRedirect {

    private String path; //���
    private boolean isRedirect;  // �����̷�Ʈ ����.

    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public boolean isRedirect() {
        return isRedirect;
    }
    public void setRedirect(boolean isRedirect) { // Redirect ���θ� ���� �޼ҵ� true: forward | false: redirect
        this.isRedirect = isRedirect; 
    }

}