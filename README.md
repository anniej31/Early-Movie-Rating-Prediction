# Early Movie Rating Prediction Through Natural Language Processing and Machine Learning
Utilizing natural language processing and machine learning models, this portfolio project predicts a movie's performance prior to its release. Developed as part of my master's degree.

## 1. Introduction

The global film industry generates billions in revenue annually, but productions often fail to meet financial and critical expectations. Given the volatility and expense of moviemaking, accurate and timely predictions of a film's performance can help stakeholders like investors, production houses, theaters, and talent better assess feasibility and optimize planning around budget, marketing, and distribution.

## 2. Research Objectives

Presently, the research area in this domain is primarily focused on the development and fine-tuning of Machine Learning algorithms. However, further investigation is required regarding the multivariate relationships and optimization of these features, to enhance customer outreach. Additionally, the application of natural language processing on textual data, such as movie title, overview, and script, for identifying patterns and customer preferences are unexplored.

Therefore, this study aims to utilize and extract relevant textual as well as metadata for forecasting box-office success pre-release through Machine Learning. Specifically, this study aims to answer the following research questions:
1. What are the important factors in predicting a movie’s rating?
2. How can attributes be used to recognize customer interests and preferences?
3. How do the performance and interpretability of linear, ensemble and non-parametric models differ in predicting a movie’s rating?

## 3. Methodology

This study uses regression models to analyse the attributes and predict the movie rating along with focusing on model interpretability. In contrast to the previous studies, for this project, a bigger dataset was used and unstructured text data such as title names, cast and crew details, as well as movie descriptors were incorporated.

The overall research process followed in this study is driven by Cross-Industry Standard Process for Data Mining (CRISP-DM). However, considering the nature of this study, the last stage, deployment, is not applicable. Instead, managerial insights and recommendations are discussed.

### 3.1 Business Understanding

The key questions this research answers are the various factors that impact a movie’s rating and how it can be used to understand customer preferences along with marketing strategies design. This study also attempts to compare the performance of various models in movie rating predictions

### 3.2 Data Understanding

This study utilized the open IMDB dataset of over 600,000 movie, TV, and video records to develop and test predictive models. Given IMDB's status as a leading entertainment data source, its contents effectively represent real-world industry information. The dataset was filtered to include only movie features spanning 2000-2020 to account for shifts in customer preferences and market dynamics over earlier eras.

Relevant pre-release variables encompassing critical details like budget, production company, and talent were absent or unclear in the IMDB data files. Therefore, supplemental pre-release features such as precise release dates were gathered through TMDB APIs.

The target variable of this study is the IMDB average user rating and the dependant variables include the metadata of the movie such as title, genre, release date, runtime, release locations, runtime, budget, director, writer, actors, actress and overview.


### 3.3 Data Preparation
The various tasks carried out in this phase are,
1. Exploratory Data Analysis
2. Data Cleaning
3. Feature Transformation and Extraction
4. Data Partitioning

### 3.4 Modelling

The various linear and ensemble models used for this study are Linear Regression, Ridge Regression, Random Forest, Support Vector Regression and Extreme Gradient Boosting.

The linear regression model was used as the baseline for comparison against other models. To ensure robustness and avoid overfitting, 10-fold Cross-Validation was used for all model training. Furthermore, Backward Elimination was used for feature selection in linear models, while Recursive Feature Elimination (RFE) was used for ensemble methods. Additionally, for ensemble methods, using Cross-Validated Random Search, the best combination of parameters was identified.

### 3.5 Evaluation

Using the test set the model performance was measured and compared using various measures such as Mean Absolute Error (MAE), Mean Squared Error (MSE), Root Mean Squared Error (RMSE) R Squared, Adjusted R Squared, and Residual Analysis. Further evaluation of model interpretability and feature significance was carried out through Tree Based Feature Importance and Accumulated Local Effect (ALE).

## 4. Summary of Findings
Multiple linear regression model incorporating text features like overview TF-IDF vectors had an RMSE of 1.13 and R-squared of 0.31, demonstrating the value of including unstructured text data.

Ridge regression led to slight improvements over linear regression with an RMSE of 1.1 and R-squared of 0.33 after backward feature elimination.

Random forest model leveraging text data performed best with an RMSE of 0.84 and R-squared of 0.37 after tuning, significantly outperforming previous models.

Extreme gradient boosting model had competitive performance to random forest with an RMSE of 0.86 and R-squared of 0.37, but was not improved much by tuning.

Key variables positively impacting prediction across models included movie runtime, genres like documentary/animation/horror, text attributes like title word count/sentiment, and information on actors.
Ensemble and non-linear techniques proved superior to linear regression, supporting need for complex modeling with this multi-dimensional dataset.

Strong predictive performance demonstrates feasibility of data-driven forecasting of movie ratings to support industry decision making based on key attributes.

## 5. Conclusion and Recommendation
The study was successful in using a bigger dataset unlike previous works and additionally reduce overfitting through feature selection and dimension reduction. The models revealed that duration, actors, and genre, especially horror, animation, and documentary, are significant attributes that can influence model performance. The statistical explorations further show movies with themes such as family, friends, love et cetera are widely accepted by the audiences. Planning the theatrical release around weekends and holidays would help investors to earn more revenue.

However, there is still room for significant model performance improvements using advanced methods like neural networks and ensemble stacking. Additionally, variables directly linked to revenue and profitability like ticket sales and distribution deals were not included due to time and computation limits. Incorporating such financial factors would better quantify movie success beyond ratings predictions.


## Data Sources
IMDb, n.d. IMDb Non-Commercial Datasets [WWW Document]. IMDb Dev. URL https://developer.imdb.com/non-commercial-datasets/ (accessed 7.7.23).
TMDB

