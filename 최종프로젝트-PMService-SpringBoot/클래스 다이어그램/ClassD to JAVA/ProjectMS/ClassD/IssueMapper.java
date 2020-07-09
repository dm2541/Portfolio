
import java.util.*;

/**
 * 
 */
public interface IssueMapper {

    /**
     * @param project_code 
     * @return
     */
    public List<IssueDTO> selectIssueList(String project_code);

    /**
     * @param project_code 
     * @param issue_name 
     * @return
     */
    public List<IssueDTO> selectIssueListByName(String project_code, String issue_name);

    /**
     * @param issue_code 
     * @return
     */
    public IssueDTO selectIssue(String issue_code);

    /**
     * @param issue 
     * @return
     */
    public void insertIssue(IssueDTO issue);

    /**
     * @param issueFile 
     * @return
     */
    public void insertIssueFile(IssueFileDTO issueFile);

    /**
     * @param actionFile 
     * @return
     */
    public void insertActionFile(ActionFileDTO actionFile);

    /**
     * @param issue_code 
     * @return
     */
    public void deleteIssue(String issue_code);

    /**
     * @param issueFile_code 
     * @return
     */
    public void deleteIssueFile(String issueFile_code);

    /**
     * @param actionFile_code 
     * @return
     */
    public void deleteActionFile(String actionFile_code);

    /**
     * @param issue 
     * @return
     */
    public void updateIssue(IssueDTO issue);

}