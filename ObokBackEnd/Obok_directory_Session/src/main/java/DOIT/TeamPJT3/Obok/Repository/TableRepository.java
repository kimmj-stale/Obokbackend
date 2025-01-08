package DOIT.TeamPJT3.Obok.Repository;

import DOIT.TeamPJT3.Obok.Entity.TargetTable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TableRepository extends JpaRepository<TargetTable , Long> {
}
