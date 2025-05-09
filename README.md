# Network Performance Optimization

## Objective

This project analyzes broadband outage data to identify patterns, prioritize maintenance, and improve service reliability. The dataset includes attributes such as outage duration, broadband type, city, priority, and volume of reports. The analysis combines **Excel Power Query** for data cleaning and transformation, **SQL** for querying and analyzing the dataset, and **Python** for visualization and statistical insights.

---

## Methodology

### Data Preparation (Excel Power Query)
- **Data Cleaning**:
  - Removed duplicates and null values.
  - Standardized categorical variables (e.g., `priority`, `bb_type`).
  - Converted `outage_duration` to a consistent format (hours).
- **Data Merging**:
  - Joined multiple tables (e.g., outage reports, area codes) using Power Query.
  - Enriched data with geographic labels (e.g., city names).

### SQL Analysis
- Calculated outage durations and frequencies by region.
- Identified hotspots (e.g., areas with outdated hardware).

### Python Visualization
- Analyzed aggregated factors using **pandas**.
- Created graphical representations with **seaborn** to showcase trends.

---

## Key Findings

### Broadband Type Comparison
- **ADSL 1** had the highest average outage volume (11.08) and frequent critical outages.
- **Cable** and **ADSL 2+** showed lower severity, suggesting more stable performance.
- **Recommendation**: Investigate ADSL 1 hardware/network vulnerabilities.

### Outage Severity Trends
- Critical outages were most common in **ADSL 1** (3.6 avg volume).
- Low-priority outages dominated overall (71% of total reports), indicating minor but frequent disruptions.

### Legacy vs. New Tech
- Legacy hardware correlates with longer outages, advocating for modernization.

### Recurring Issues
- Certain log types (e.g., "Router Failure") require urgent resolution to reduce recurrence.

---

## Recommendations

1. **Infrastructure Investment**:
   - Target **ADSL 1 networks** in Munich and Mashhad.
2. **Real-Time Monitoring**:
   - Implement alerts for critical outages in high-risk areas.
3. **Preventive Maintenance**:
   - Address recurring low-priority issues in cities like Touba.
4. **Data Enrichment**:
   - Incorporate weather or population density data to contextualize outages.

---

## Tools and Technologies Used
- **Excel Power Query**: Data cleaning and transformation.
- **SQL**: Querying and analyzing the dataset.
- **Python**: Visualization and statistical insights with pandas and seaborn.

---

## Contact

For any questions or feedback, feel free to contact the repository maintainer:

- **GitHub**: [ChirathW](https://github.com/ChirathW)

We hope this analysis helps improve network performance and service reliability!
