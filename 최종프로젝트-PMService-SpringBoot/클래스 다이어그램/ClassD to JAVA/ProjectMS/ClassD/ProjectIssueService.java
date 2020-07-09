
import java.util.*;

/**
 * 
 */
public interface ProjectIssueService {

    /**
     * @param issue_name 
     * @return
     */
    public List<IssueDTO> getProjectIssueListByName(String issue_name);

    /**
     * @param issue_code 
     * @return
     */
    public int putProjectIssue(String issue_code);

    /**
     * @param issueFile_code 
     * @return
     */
    public int removeProjectIssueFile(String issueFile_code);

    /**
     * @param issueFile 
     * @return
     */
    public int postProjectIssueFile(IssueFileDTO issueFile);

    /**
     * @param actionFile_code 
     * @return
     */
    public int removeProjectActionFile(String actionFile_code);

    /**
     * @param actionFile 
     * @return
     */
    public int postProjectActionFile(ActionFileDTO actionFile);

}