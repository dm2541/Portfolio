
import java.util.*;

/**
 * 
 */
public interface DashBoardAllService {

    /**
     * @return
     */
    public List<ProjectStatusVO> getProjectAllStatusCount();

    /**
     * @return
     */
    public List<IssueStatusVO> getIssueAllStatusCount();

}