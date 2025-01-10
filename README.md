# MySQL-Soccer_Database_Management
# Soccer/Football Relational and Document Database Project

## Team: Stormers  
### Team Members:
- **Nirmit Dagli - Team Lead**  
- **Srujan Sai Vemula**  
- **Nicholas Darko Brown**

---

## Project Overview
This project focuses on designing and implementing a relational and NoSQL database system for comprehensive soccer/football data management. The databases support various use cases such as player performance evaluation, team performance tracking, and injury impact analysis.

---

## Project Goals
1. **Provide detailed insights into player performance** to support scouting and squad decisions.
2. **Monitor team-level metrics** such as wins, attendance, and point trends.
3. **Assess injury impacts** on player performance and recovery.
4. **Identify young talent** for long-term investment and player development.
5. **Evaluate creative contributions** of midfielders and forwards for tactical planning.

---

## Database Design

### **Relational Database (SQL)**
- **Key Tables**:
  - `player`: Stores player details (e.g., name, birthday).
  - `team`: Contains team details (e.g., name, stadium).
  - `player_match_stats`: Match performance data (e.g., goals, assists).
  - `contract`: Links players to their current teams.
  - `injury`: Tracks injury history and recovery data.
- **SQL Queries**: Optimized for retrieving performance metrics and reports for different use cases.

### **Document Database (MongoDB)**
- **Schema Structure**:
  - Centralized `player` document embedding:
    - Personal info, team details, match stats, contracts, injuries, and transfers.
  - Embedded arrays for match stats, tournaments, and injuries to facilitate fast read-heavy operations.
- **Design Highlights**:
  - Avoids excessive joins by embedding frequently accessed attributes.
  - Allows flexible addition of new fields to support advanced analytics.

---

## Use Cases and Queries

### 1. **Player Performance Analysis**
   - **Purpose**: Evaluate player contributions (goals, assists, passing efficiency).
   - **Key Filters**: Players with at least 3 matches and 3 goal contributions.
   - **SQL Query Sample**:
     ```sql
     SELECT p.name AS player_name, t.team_name, COUNT(DISTINCT pms.match_id) AS matches_played,
     SUM(pms.goals_scored) AS total_goals, SUM(pms.assists) AS total_assists
     FROM player p
     JOIN player_match_stats pms ON p.player_id = pms.player_id
     WHERE matches_played >= 3 AND (total_goals + total_assists) >= 3;
     ```

### 2. **Young Talent Analysis**
   - **Purpose**: Track players born after 2001 (under 23).
   - **Key Metrics**: Age verification, production metrics, playing time.

### 3. **Team Performance Analysis**
   - **Purpose**: Monitor team win/loss records, average attendance, and points calculation.
   - **Filters**: Teams with at least 3 matches played.

### 4. **Injury Impact Analysis**
   - **Purpose**: Measure post-injury performance and recovery time.
   - **Key Filters**: Players with recorded injuries and at least 2 post-injury matches.

### 5. **Playmaker Performance Analysis**
   - **Purpose**: Assess midfielders and forwards based on assists and passing efficiency.
   - **Key Filters**: Minimum 2 assists and 3 matches played.

---

## MongoDB Collection Sample
```json
{
  "player_id": "P123",
  "name": "John Doe",
  "team": {
    "name": "Stormers FC",
    "stadium": "Stadium A",
    "market_value": 20000000
  },
  "match_stats": [
    {
      "match_id": "M101",
      "goals_scored": 2,
      "assists": 1,
      "minutes_played": 90
    }
  ],
  "injuries": [
    {
      "injury_id": "I001",
      "injury_date": "2023-03-01",
      "recovery_days": 45
    }
  ]
}
