# Depression and Anxiety in Medical Students: Analyses Report 
Juan C. López Tavera  



## Background and Objectives

There's no health without mental health; especially since mental illnesses account for one of the leading --if not the leading-- causes of years lived with disability across the globe. Yet, the burden of mental health is often underestimated.

Obesity and overweight are also a heavy burden on public health; they are important risk factors for a considerable number of chronic illnesses --notably cardiovascular diseases-- and are a leading cause of disability as well.

Given how common and relevant these health issues are, we were motivated to look deeper into them, and we asked ourselves: if someone has obesity or overweight, is she more likely to suffer depression or anxiety? How do obesity and overweight interact with mental health issues?   

If we could reject the null hypothesis that a higher body-mass index (BMI) does not predict the presence of depression or anxiety disorders, we would help to more easily spotlight individuals who might need further psychiatric assistance. To test this hypothesis, we designed an observational study to measure demographic, BMI and mental health variables of Mexican Medical Students.

In this report, I'm focusing on communicating what we found, which is the basis of a more formal publication (in the making).

# Methods

We designed and ran an observational research study to assess the relation between clinically detectable depressive and anxiety disorders and body-mass index. 

To achieve this goal, we randomly selected 1250 undergrad medical students from all grades, from first through fourth. Grouped by grade enrollment, the number of sampled students was proportional to the actual number of students enrolled in each grade.

In November 2013, in _sunny_ Guadalajara during a in a four-day window, we personally distributed 1250 surveys to undergraduate medical studentes, and collected 783 undergrad medical students (from 1 through 4 school years), from which we discarded 26 to get a final sample size of 757. [Open question: should we keep them?]

With a response rate of 0.6%, we got to a final sample size of n = 783. In the following table, we show the preogression of how we arrived to the final sample size. 

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> Grade </th>
   <th style="text-align:right;"> N </th>
   <th style="text-align:right;"> Intended_n </th>
   <th style="text-align:right;"> Sampled_n </th>
   <th style="text-align:right;"> Complete_n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 1299 </td>
   <td style="text-align:right;"> 339 </td>
   <td style="text-align:right;"> 275 </td>
   <td style="text-align:right;"> 263 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 1285 </td>
   <td style="text-align:right;"> 379 </td>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 184 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 1061 </td>
   <td style="text-align:right;"> 296 </td>
   <td style="text-align:right;"> 140 </td>
   <td style="text-align:right;"> 136 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 930 </td>
   <td style="text-align:right;"> 236 </td>
   <td style="text-align:right;"> 176 </td>
   <td style="text-align:right;"> 174 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> total </td>
   <td style="text-align:right;"> 4575 </td>
   <td style="text-align:right;"> 1250 </td>
   <td style="text-align:right;"> 783 </td>
   <td style="text-align:right;"> 757 </td>
  </tr>
</tbody>
</table>

The following diagram depicts how we arrived at the final sample size. 

<!--html_preserve--><div id="htmlwidget-370381cdea0c0f53fb9f" style="width:672px;height:480px;" class="DiagrammeR html-widget"></div>
<script type="application/json" data-for="htmlwidget-370381cdea0c0f53fb9f">{"x":{"diagram":"\ngraph LR\n        A(4575 students)-->B(1250 sampled students)\n        B-->C(783 returned surveys)\n        C-->D(757 complete surveys)\n        "},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

 



  

Distinguish prespecified from exploratory analyses, including subgroup analyses.

## Ethics Statement


## Variables

Clearly define all outcomes, exposures, predictors, potential confounders, and effect modifiers. Give diagnostic criteria, if applicable

* Socio-demographic questions and self-reported body measurements: age, binary gender, height and weight. 
* Patient Health Questionnaire 9: Self-reported questionaire to spot cases of clinically detectable depressive disorders. 
* General Anxiety Disorder 7: Self-reported questionaire to detect cases of clinical anxiety. 
* Epworth Scale: To assess levels of self-reported day-sleepiness. 
* Clinical attention history: Have you ever been diagnosed with X? Have you ever prescribed to treat X? 

## Data sources and measurement

About BMI, PHQ, GAD y Epworth

See the [reprinted the original survey](medstudents-depression/reference/Cuestionario final español - Google Forms.pdf) in Spanish.

## Bias

The main limitation of this study was [survivorship bias](https://en.wikipedia.org/wiki/Survivorship_bias]): what happened to the 493 missing observations? 

Another potential limitation of the study might be the length of the survey affecting the number of missing responses, but, as can be seen in the right plot, the number of NAs in the data set is still low.  

<img src="README_files/figure-html/NA distribution-1.png" style="display: block; margin: auto;" />


## Statistical methods

For observational studies, authors are required to clearly specify (a) What specific hypotheses the researchers intended to test, and the analytical methods by which they planned to test them; (b) What analyses they actually performed; and (c) When reported analyses differ from those that were planned, authors must provide transparent explanations for differences that affect the reliability of the study's results

(a) Describe all statistical methods, including those used to control for confounding

(b) Describe any methods used to examine subgroups and interactions

(c) Explain how missing data were addressed

(d)Cross-sectional study—If applicable, describe analytical methods taking account of sampling strategy

(e) Describe any sensitivity analyses

I used R version 3.3.3 (2017-03-06) -- Another Canoe on a x86_64-apple-darwin13.4.0 (64-bit) platform. The packages used are: 

# Results

We randomly selected 1200 Medical students out of ~3000 enrolled at the time, and stratified this target population by school year, weighting the subsampling process according to the size of each stratum, which made the subsample size of proportional to the subpopulation size. We got a population (see Table 1)

The Results section should include all primary and secondary outcome measures analyzed. The section may be divided into subsections, each with a concise subheading. Tables and figures central to the study should be included in the main paper. The Results section should be written in past tense.

PLOS journals require authors to make all data underlying the findings described in their manuscript fully available without restriction, with rare exception.

Large data sets, including raw data, may be deposited in an appropriate public repository. [See our list of recommended repositories.](http://journals.plos.org/plosmedicine/s/data-availability#loc-recommended-repositories)

For smaller data sets and certain data types, authors may provide their data within [Supporting Information files ](http://journals.plos.org/plosmedicine/s/supporting-information)accompanying the manuscript. Authors should take care to maximize the accessibility and reusability of the data by selecting a file format from which data can be efficiently extracted (for example, spreadsheets or flat files should be provided rather than PDFs when providing tabulated data).

*Give numeric results not only as derivatives (for example, percentages) but also as the absolute numbers from which the derivatives were calculated, and specify the statistical significance attached to them, if any. Restrict tables and figures to those needed to explain the argument of the paper and to assess supporting data. Use graphs as an alternative to tables with many entries; do not duplicate data in graphs and tables. Avoid nontechnical uses of technical terms in statistics, such as "random" (which implies a randomizing device), “normal,” “significant,” “correlations,” and “sample.”*

## Participants

(a) Report numbers of individuals at each stage of study—eg numbers potentially eligible, examined for eligibility, confirmed eligible, included in the study, completing follow-up, and analysed

(b) Give reasons for non-participation at each stage

(c) Consider use of a flow diagram

## Descriptive data

(a) Give characteristics of study participants (eg demographic, clinical, social) and information on exposures and potential confounders

(b) Indicate number of participants with missing data for each variable of interest

## Depressive disorders data

<img src="README_files/figure-html/Depression density scaled by severity-1.png" style="display: block; margin: auto;" />


## Anxiety disorders data

<img src="README_files/figure-html/Anxiety density scaled by severity-1.png" style="display: block; margin: auto;" />



## Main results

(a) Give unadjusted estimates and, if applicable, confounder-adjusted estimates and their precision (eg, 95% confidence interval). Make clear which confounders were adjusted for and why they were included

(b) Report category boundaries when continuous variables were categorized

(c) If relevant, consider translating estimates of relative risk into absolute risk for a meaningful time period

## Other analyses

Report other analyses done—eg analyses of subgroups and interactions, and sensitivity analyses


# Conclusions

Interpretation of the results with any important recommendations for future research.

