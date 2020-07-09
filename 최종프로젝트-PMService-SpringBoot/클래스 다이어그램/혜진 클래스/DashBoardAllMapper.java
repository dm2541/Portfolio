
import java.util.*;

/**
 * 
 */
public interface DashBoardAllMapper {

    /**
     * @return
     */
    public List<ProjectStatusVO> selectProjectAllStatusCount();

    /**
     * @return
     */
    public List<IssueStatusVO> selectIssueAllStatusCount();

}