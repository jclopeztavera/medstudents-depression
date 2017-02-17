---
title: "Depression and Anxiety in Medical Students: Analyses Report "
author: Juan C. López Tavera
output:
  html_document:
    keep_md: yes
    theme: cosmo
---



## Background and Objectives

There's no health without mental health; especially since mental illnesses account for one of the leading --if not the leading-- causes of years lived with disability across the globe. Yet, the burden of mental health is often underestimated.

Obesity and overweight are also a heavy burden on public health; they are important risk factors for a considerable number of chronic illnesses --notably cardiovascular diseases-- and are a leading cause of disability as well.

Given how common and relevant these health issues are, we were motivated to look deeper into them, and we asked ourselves: if someone has obesity or overweight, is she more likely to suffer depression or anxiety? How do obesity and overweight interact with mental health issues?   

If we could reject the null hypothesis that a higher body-mass index (BMI) does not predict the presence of depression or anxiety disorders, we could help to more easily spotlight individuals who might need further psychiatric assistance. To test this hypothesis, we designed an observational study to measure demographic, BMI and mental health variables of Mexican Medical Students (the largest population we could access at the time). 

In this report, I'm going to focus on casually communicating what we found, which is the basis of a scientific publication in the making.

# Methods

* Describe the study participants or what was studied (e.g., patient population, cell lines; be as specific as possible, including numbers of individuals studied). Describe the study design, intervention if applicable, main methods used, primary outcome measure(s), and length of follow up if applicable.

* [If appropriate, include how many participants were assessed out of those enrolled. For survey research, include the response rate.]

* [If critical to the understanding of the paper, describe how results were analyzed, i.e., which specific statistical tests were used.]

* Describe the main outcomes and quantify the results using a measure of precision (e.g., 95% confidence interval). Describe any adverse events.

* Describe the main limitations of the study.

Describe statistical methods with enough detail to enable a knowledgeable reader with access to the original data to judge its appropriateness for the study and to verify the reported results. When possible, quantify findings and present them with appropriate indicators of measurement error or uncertainty (such as confidence intervals). Avoid relying solely on statistical hypothesis testing, such as P values, which fail to convey important information about effect size and precision of estimates. References for the design of the study and statistical methods should be to standard works when possible (with pages stated). 

We used R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch" on a x86_64-apple-darwin13.4.0 (64-bit) platform.  the statistical software package(s) and versions used. Distinguish prespecified from exploratory analyses, including subgroup analyses.

## Ethics Statement

## Study design

During winter of 2013, we designed a cross-sectional observational study to be conducted in the campus of Universidad Autónoma de Guadalajara, a big Mexican private university.

## Setting

Describe the setting, locations, and relevant dates, including periods of recruitment, exposure, follow-up, and data collection

## Participants

Give the eligibility criteria, and the sources and methods of selection of participants

## Variables

Clearly define all outcomes, exposures, predictors, potential confounders, and effect modifiers. Give diagnostic criteria, if applicable

## Data sources and measurement

For each variable of interest, give sources of data and details of methods of assessment (measurement). Describe comparability of assessment methods if there is more than one group

## Bias

Describe any efforts to address potential sources of bias.

### Response Bias
Response bias is a general term for a wide range of cognitive biases that influence the responses of participants away from an accurate or truthful response (from (Wikipedia)[https://en.wikipedia.org/wiki/Response_bias#History_of_research])


### Survivorship bias
Survivorship bias, or survival bias, is the logical error of concentrating on the people or things that "survived" some process and inadvertently overlooking those that did not because of their lack of visibility. This can lead to false conclusions in several different ways. The survivors may be actual people, as in a medical study, or could be companies or research subjects or applicants for a job, or anything that must make it past some selection process to be considered further (from (Wikipedia)[https://en.wikipedia.org/wiki/Survivorship_bias])

<img src="figure/NA distribution-1.png" title="plot of chunk NA distribution" alt="plot of chunk NA distribution" style="display: block; margin: auto;" />


## Study size

Explain how the study size was arrived at 1376



## Quantitative variables

Explain how quantitative variables were handled in the analyses. If applicable, describe which groupings were chosen and why

## Statistical methods

For observational studies, authors are required to clearly specify (a) What specific hypotheses the researchers intended to test, and the analytical methods by which they planned to test them; (b) What analyses they actually performed; and (c) When reported analyses differ from those that were planned, authors must provide transparent explanations for differences that affect the reliability of the study's results

(a) Describe all statistical methods, including those used to control for confounding

(b) Describe any methods used to examine subgroups and interactions

(c) Explain how missing data were addressed

(d)Cross-sectional study—If applicable, describe analytical methods taking account of sampling strategy

(e) Describe any sensitivity analyses

(f) Technical details of the analysis

# Results

During fall 2014, we collected mental health data and sociodemographic survey data from Medical students enrolled at Universidad Autónoma de Guadalajara —a large private university that offers one of the oldest Medical School programmes in the country.

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

<img src="figure/Depression density scaled by severity-1.png" title="plot of chunk Depression density scaled by severity" alt="plot of chunk Depression density scaled by severity" style="display: block; margin: auto;" />


## Anxiety disorders data

<img src="figure/Anxiety density scaled by severity-1.png" title="plot of chunk Anxiety density scaled by severity" alt="plot of chunk Anxiety density scaled by severity" style="display: block; margin: auto;" />



## Main results

(a) Give unadjusted estimates and, if applicable, confounder-adjusted estimates and their precision (eg, 95% confidence interval). Make clear which confounders were adjusted for and why they were included

(b) Report category boundaries when continuous variables were categorized

(c) If relevant, consider translating estimates of relative risk into absolute risk for a meaningful time period

## Other analyses

Report other analyses done—eg analyses of subgroups and interactions, and sensitivity analyses


# Conclusions

Interpretation of the results with any important recommendations for future research.

