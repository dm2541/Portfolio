
import java.util.*;

/**
 * 
 */
public class ResponseProjectIssueController {

    /**
     * Default constructor
     */
    public ResponseProjectIssueController() {
    }

    /**
     * 
     */
    private ProjectIssueService projectIssueService;


    /**
     * @param issue_name 
     * @return
     */
    public List<IssueDTO> getProjectIssueListByName(String issue_name) {
        // TODO implement here
        return null;
    }

    /**
     * @param issue 
     * @return
     */
    public int putProjectIssue(IssueDTO issue) {
        // TODO implement here
        return 0;
    }

    /**
     * @param issueFile_code 
     * @return
     */
    public int removeProjectIssueFile(String issueFile_code) {
        // TODO implement here
        return 0;
    }

    /**
     * @param issueFile 
     * @return
     */
    public int postProjectIssueFile(IssueFileDTO issueFile) {
        // TODO implement here
        return 0;
    }

    /**
     * @param actionFile_code 
     * @return
     */
    public int removeProjectActionFile(String actionFile_code) {
        // TODO implement here
        return 0;
    }

    /**
     * @param actionFile 
     * @return
     */
    public int postProjectActionFile(ActionFileDTO actionFile) {
        // TODO implement here
        return 0;
    }

}