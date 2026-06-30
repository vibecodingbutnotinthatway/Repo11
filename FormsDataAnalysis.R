library(tidyverse)
library(googlesheets4)
sheetsdata <- read_sheet("1m2Huoym89SjV3SWrwcSDaMXvvdPuNLFPDQUn79uHEu4")
sheetsdata
sheetsdata <- sheetsdata %>% rename(
  #Demographics
  'Country' = 'What country (countries if multiple) do you live in',
  'Gender' = 'What gender do you identify as', 
  'Age' = 'How old are you in years?', 
  #Use Times for the diferent social medias
  'UTInstagram' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Instagram ]',
  'UTTikTok' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [TikTok]',
  'UTYoutube' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Youtube]',
  'UTTumblr' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Tumblr]',
  'UTFacebook' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Facebook]',
  'UTTwitter' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Twitter]',
  'UTReddit' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [Reddit]',
  'UT4chan' = 'Which of the following have you used in the past 2 weeks, what is the average amount of time spent daily? [4chan]',
  #Watch Frequencies
  'WFQPsych2Go' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [Psych2Go]',
  'WFQHealthyGamerGG' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [HealthyGamerGG]',
  'WFQCrashCourse' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [CrashCourse]',
  'WFQDirtyMedicine' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [Dirty Medicine]',
  'WFQPracticalPsychology' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [Practical Psychology]',
  'WFQMemorablePsychology' = 'On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [Memorable Psychology]',
  'WFQKhanAcademy' ='On a 5-point scale, how often have you encountered the following content creators in the past 2 weeks? [Khan Academy]',
  'WFQOthers' = 'Outside of the previously listed, do you personally watch any other creators whose content involves personality disorders?
If you could, do list them',
  'PDContentFQ' = 'On a 1–5 point scale, how often when on social media do you see content involving personality disorders',
  'PDAdsFQ' = 'Similarly, how often when on social media do you get ads involving personality disorders',
  'PDContentAcademicFQ' = 'When/If you interact with content, i.e. watching a video, involving personality disorders how often is it from a peer reviewed source, or by a licenced professional/practitioner.',
  #Societal view about (people with) personality disorders
  'PDSVCapacityToCareAboutOthers' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Capactity to care about others]',
  'PDSVCleanliness' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Cleanliness]',
  'PDSVSelfControl' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Self Control]',
  'PDSVIntelligence' = 'The view of people in your society about people with personality disorders across the following domains is by large: [ Intelligence]',
  'PDSVEconomic' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Economic]',
  'PDSVPolitical' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Political ]',
  'PDSVViolence' = 'The view of people in your society about people with personality disorders across the following domains is by large: [Violence]',
  'PDPVCleanliness' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Cleanliness]',
  'PDPVCapacityToCareAboutOthers' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Capactity to care about others]',
  'PDPVSelfControl' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Self Control]',
  'PDPVIntelligence' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [ Intelligence]',
  'PDPVEconomic' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Economic]',
  'PDPVPolitical' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Political]',
  'PDPVViolence' = 'In the same vein as the previous question, where would you personally place people with people with personally disorders across the following themes: [Violence]',
  #Personality Disorder Associations
  'AnakasticPdAssociationsCheckbox' = 'Out of the following, which do you agree with

People with a personality disorder characterised by mild emotional instability and perfectionism are in general:',
  'DissNaPdAssociationViolent' = 'Generally speaking, someone with a personality disorder characterised by an inability to properly feel empathy and reckless behaviour is: [Violent]',
  'DissNaPdAssociationCriminalTendency' = 'Generally speaking, someone with a personality disorder characterised by an inability to properly feel empathy and reckless behaviour is: [Likely to commit a crime]',
  'DissNaPdAssociationManipulative' = 'Generally speaking, someone with a personality disorder characterised by an inability to properly feel empathy and reckless behaviour is: [Manipulative]',
  'DissNaPdAssociationCapabaleofkindness' = 'Generally speaking, someone with a personality disorder characterised by an inability to properly feel empathy and reckless behaviour is: [Capabale of kindness]',
  'DissNaPdAssociationAbleToSelfManage' = 'Generally speaking, someone with a personality disorder characterised by an inability to properly feel empathy and reckless behaviour is: [Able to self manage]',
  'AdditionalInfoShortAnswer' = 'If there is anything not covered here that you wish to address, do so below',
  #Personality Disorder Recognition, I know its formatted funny but I promise it needs to be this way
  'AustismRecognition' = "A patient shows to a clinic with concerns about a potential personality disorder after recommendation from their friends.  After a survey the clinician finds that the patient exhibits the following traits: A stable but limited emotional experience, is often described by others as 'stubborn', and gets overwhelmed when things do not follow an anticipated sequence. 

To what degree does this report indicate that the patient has a personality disorder?",
  'BPDRecognition' = "A patient reports that over the past 2 years they have been experiencing high emotional instability; struggles, and is periodically unable, to consider the feelings of others, and is impulsive. These symptoms most often appear in interpersonal relationships and are particularly apparent with intimate relationships.

This is best described by which of the following:",
  'AnakasticRecognition' = "A Patient is referred to a clinic by their therapist after they report having a high fixation of upkeeping social rules and workplace standards, they get upset with and don't understand why people don't strictly adhere to the rules. Additionally, they report getting complaints upon fixing the work of other employees at their job. 

To what degree does this indicate a personality disorder?",
  'BipolarRecognition' = "A 19 year old patient is sent to an emergency ward after hotwiring a car for an illegal street race and getting into a crash. During an interview with a Consultant psychiatrist, the family of the patient describes that over the past 2 years the patient had been exhibiting cyclical mood swings between a heightened mood and a depressive one. The day prior to the crash the family states that the patient was exhibiting delusions of grandeur and couldn't stay focused.

 Given the above the consultant recommends that the patient gets further interviews for:",
  'GeneralPDRecognition' = "A patient presents to a clinic on a whim after seeing an advertisement. During a social-activity based assessment the clinician finds the following: The patient significantly underperforms in social activities regarding ethics and empathy, the patient has medium to high impulsive tendencies, and the patient performs within normal bounds on all other activities.
This aligns with the following interview with the patient by the clinician. Additionally, the patient reports these behaviours started around the age of 17 and became significant around the age of 22. And reports no history of head trauma. 

Based on this, which of the below best describes the patient:",
  #Definitions
  'DefinitionsAgreeancePsychoSocialDisruption' = 'In general, to what degree do you agree with the below definitions for personality disorder? [A disturbance in personality functioning, which is associated with personal and social disruption]',
  'DefinitionAgreeanceNeurologicalCondition' = 'In general, to what degree do you agree with the below definitions for personality disorder? [A neurological condition, similar to autism, which impairs a persons aspects of personality function]',
  'DefinitionAgreeanceDescriptive/Classifying' = 'In general, to what degree do you agree with the below definitions for personality disorder? [A descriptive term used by psychologists to classify patients]',
  'DefinitionsAgreeanceMoodDisorder' = 'In general, to what degree do you agree with the below definitions for personality disorder? [A mood disorder, similar to bipolar, which is characterised by periods of extreme moods]',
  'ClassificationSystemValidityScore' = 'To what degree do you agree with the following statement:
The categories for different personality disorders (e.g. borderline personality disorder, avoidant personality disorder) is a valid diagnosis.',
  'PDTraitsCheckbox' = 'A person with a personality disorder may exhibit which of the following traits:'
)

updateModedUT <- function(){
  ModedUTInstagram <- sheetsdata |>
  select(UTInstagram) |>
  mutate(
    UTInstagram = UTInstagram |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTYoutube <- sheetsdata |>
  select(UTYoutube) |>
  mutate(
    UTYoutube = UTYoutube |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTTikTok <- sheetsdata |>
  select(UTTikTok) |>
  mutate(
    UTTikTok = UTTikTok |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTTumblr <- sheetsdata |>
  select(UTTumblr) |>
  mutate(
    UTTumblr = UTTumblr |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTFacebook <- sheetsdata |>
  select(UTFacebook) |>
  mutate(
    UTFacebook = UTFacebook |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTTwitter <- sheetsdata |>
  select(UTTwitter) |>
  mutate(
    UTTwitter = UTTwitter |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUTReddit <- sheetsdata |>
  select(UTReddit) |>
  mutate(
    UTReddit = UTReddit |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
ModedUT4chan <- sheetsdata |>
  select(UT4chan) |>
  mutate(
    UT4chan = UT4chan |>
    replace_values(
      "Dont Use" ~ "0",
      "Less than 1 hour" ~ "0.5",
      "Less than 3 hours" ~ "1",
      "Less than 5 hours" ~ "3",
      "Less than 7 hours" ~ "5",
      "Less than 9 hours" ~ "7",
      "Less than 10 hours" ~ "9",
      "Atleast 10 hours" ~ "10"
    ) |> as.numeric()
  )
  ModedUT <- bind_cols(ModedUTInstagram,ModedUTYoutube,ModedUTTikTok,ModedUTTumblr,ModedUTFacebook, ModedUTTwitter, ModedUTReddit, ModedUT4chan)
  #return(ModedUT)
}
updateModedWFQ <- function(){
  ModedWFQPsych2Go <- sheetsdata |>
    select(WFQPsych2Go) |>
    mutate(
      WFQPsych2Go = WFQPsych2Go|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    ) 
  ModedWFQHealthyGamerGG <- sheetsdata |>
    select(WFQHealthyGamerGG) |>
    mutate(
      WFQHealthyGamerGG = WFQHealthyGamerGG|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    )
  ModedWFQCrashCourse <- sheetsdata |>
    select(WFQCrashCourse) |>
    mutate(
      WFQCrashCourse = WFQCrashCourse|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    )
  ModedWFQKhanAcademy <- sheetsdata |>
    select(WFQKhanAcademy) |>
    mutate(
      WFQKhanAcademy = WFQKhanAcademy|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    ) 
  ModedWFQDirtyMedicine <- sheetsdata |>
    select(WFQDirtyMedicine) |>
    mutate(
      WFQDirtyMedicine = WFQDirtyMedicine|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    ) 
  ModedWFQPracticalPsychology <- sheetsdata |>
    select(WFQPracticalPsychology) |>
    mutate(
      WFQPracticalPsychology = WFQPracticalPsychology|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    ) 
  ModedWFQMemorablePsychology <- sheetsdata |>
    select(WFQMemorablePsychology) |>
    mutate(
      WFQMemorablePsychology = WFQMemorablePsychology|> 
        replace_values(
          "Haven't Seen" ~ "0",
          "Have been recomended but havent seen" ~ "1",
          "Have seen" ~ "2",
          "Watch Occasionally" ~ "3",
          "Watch frequently" ~ "4"
        ) |> as.numeric()
    )
    ModedWFQ <- bind_cols(ModedWFQPsych2Go, ModedWFQHealthyGamerGG, ModedWFQCrashCourse, ModedWFQKhanAcademy, ModedWFQDirtyMedicine, ModedWFQPracticalPsychology, ModedWFQMemorablePsychology)
    #return(ModedWFQ)
}
updateModedAcademicFQ <- function(){
  sheetsdata |> 
    select(PDAcademicFQ) |>
    mutate(
      PDAcademicFQ = PDAcademicFQ |>
        return_values(
          "Always" ~ "5",
          "Often" ~ "4",
          "Sometimes" ~ "3",
          "Rarely" ~ "2",
          "Never" ~ "1",
          "Dont Know" ~ "0"
        ) |> as.numeric()
    )
}
updateModedPDSV <- function(){
  ModedPDSVCapacityToCareAboutOthers <- sheetsdata |>
    select(PDSVCapacityToCareAboutOthers) |>
    mutate(
      PDSVCapacityToCareAboutOthers = PDSVCapacityToCareAboutOthers |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVCleanliness <- sheetsdata |>
    select(PDSVCleanliness) |>
    mutate(
      PDSVCleanliness = PDSVCleanliness |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVSelfControl <- sheetsdata |>
    select(PDSVSelfControl) |>
    mutate(
      PDSVSelfControl = PDSVSelfControl |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVIntelligence <- sheetsdata |>
    select(PDSVIntelligence) |>
    mutate(
      PDSVIntelligence = PDSVIntelligence |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVEconomic <- sheetsdata |>
    select(PDSVEconomic) |>
    mutate(
      PDSVEconomic = PDSVEconomic |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVPolitical <- sheetsdata |>
    select(PDSVPolitical) |>
    mutate(
      PDSVPolitical = PDSVPolitical |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSVViolence <- sheetsdata |>
    select(PDSVViolence) |>
    mutate(
      PDSVViolence = PDSVViolence |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDSV <- bind_cols(ModedPDSVCapacityToCareAboutOthers, ModedPDSVCleanliness, ModedPDSVSelfControl, ModedPDSVIntelligence, ModedPDSVEconomic, ModedPDSVPolitical, ModedPDSVViolence)
}
updateModedPDPV <- function(){
  ModedPDPVCapacityToCareAboutOthers <- sheetsdata |>
    select(PDPVCapacityToCareAboutOthers) |>
    mutate(
      PDPVCapacityToCareAboutOthers = PDPVCapacityToCareAboutOthers |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVCleanliness <- sheetsdata |>
    select(PDPVCleanliness) |>
    mutate(
      PDPVCleanliness = PDPVCleanliness |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVSelfControl <- sheetsdata |>
    select(PDPVSelfControl) |>
    mutate(
      PDPVSelfControl = PDPVSelfControl |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVIntelligence <- sheetsdata |>
    select(PDPVIntelligence) |>
    mutate(
      PDPVIntelligence = PDPVIntelligence |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVEconomic <- sheetsdata |>
    select(PDPVEconomic) |>
    mutate(
      PDPVEconomic = PDPVEconomic |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVPolitical <- sheetsdata |>
    select(PDPVPolitical) |>
    mutate(
      PDPVPolitical = PDPVPolitical |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPVViolence <- sheetsdata |>
    select(PDPVViolence) |>
    mutate(
      PDPVViolence = PDPVViolence |>
        recode_values(
          "Strongly Negative" ~ "-2",
          "Somewhat Negative"~ "-1",
          "Neutral/No Opinion" ~ "0",
          "Somewhat Positive" ~ "1",
          "Strongly Positive" ~ "2"
        ) |> as.numeric()
    )
  ModedPDPV <- bind_cols(ModedPDPVCapacityToCareAboutOthers, ModedPDPVCleanliness, ModedPDPVSelfControl, ModedPDPVIntelligence, ModedPDPVEconomic, ModedPDPVPolitical, ModedPDPVViolence)
}
updateModedDissNaPdAssociation <- function(){
  ModedDissNaPdAssociationViolent <- sheetsdata |>
    select(DissNaPdAssociationViolent) |>
    mutate(
      DissNaPdAssociationViolent = DissNaPdAssociationViolent |>
        recode_values(
          "Fully Disagree" ~ "-2",
          "Slightly Disagree"~ "-1",
          "Neutral" ~ "0",
          "Slightly Agree" ~ "1",
          "Fully Agree" ~ "2"
        ) |> as.numeric()
    )
  ModedDissNaPdAssociationCriminalTendency <- sheetsdata |>
    select(DissNaPdAssociationCriminalTendency) |>
    mutate(
      DissNaPdAssociationCriminalTendency = DissNaPdAssociationCriminalTendency |>
        recode_values(
          "Fully Disagree" ~ "-2",
          "Slightly Disagree"~ "-1",
          "Neutral" ~ "0",
          "Slightly Agree" ~ "1",
          "Fully Agree" ~ "2"
        ) |> as.numeric()
    )
  ModedDissNaPdAssociationManipulative <- sheetsdata |>
    select(DissNaPdAssociationManipulative) |>
    mutate(
      DissNaPdAssociationManipulative = DissNaPdAssociationManipulative |>
        recode_values(
          "Fully Disagree" ~ "-2",
          "Slightly Disagree"~ "-1",
          "Neutral" ~ "0",
          "Slightly Agree" ~ "1",
          "Fully Agree" ~ "2"
        ) |> as.numeric()
    )
  ModedDissNaPdAssociationCapabaleofkindness <- sheetsdata |>
    select(DissNaPdAssociationCapabaleofkindness) |>
    mutate(
      DissNaPdAssociationCapabaleofkindness = DissNaPdAssociationCapabaleofkindness |>
        recode_values(
          "Fully Disagree" ~ "-2",
          "Slightly Disagree"~ "-1",
          "Neutral" ~ "0",
          "Slightly Agree" ~ "1",
          "Fully Agree" ~ "2"
        ) |> as.numeric()
    )
  ModedDissNaPdAssociationAbleToSelfManage <- sheetsdata |>
    select(DissNaPdAssociationAbleToSelfManage) |>
    mutate(
      DissNaPdAssociationAbleToSelfManage = DissNaPdAssociationAbleToSelfManage |>
        recode_values(
          "Fully Disagree" ~ "-2",
          "Slightly Disagree"~ "-1",
          "Neutral" ~ "0",
          "Slightly Agree" ~ "1",
          "Fully Agree" ~ "2"
        ) |> as.numeric()
    )

  ModedDissNaPdAssociation <- bind_cols(ModedDissNaPdAssociationViolent, ModedDissNaPdAssociationCriminalTendency, ModedDissNaPdAssociationManipulative, ModedDissNaPdAssociationCapabaleofkindness, ModedDissNaPdAssociationAbleToSelfManage)
}
updateModedAnakasticPdAssociations <- function(){
  rule <- function(x){#The values for this one are difficult, these will be decided post interviews
    a <- grepl("More Likely to do drugs",x, fixed=TRUE)
    b <- grepl("More Violent",x, fixed=TRUE)
    c <- grepl("Are able to self manage without therapy",x, fixed=TRUE)
    d <- grepl("Complete tasks at a higher quality than others",x, fixed=TRUE)
    e <- grepl("Are more book smart",x, fixed=TRUE)
    f <- grepl("Are less street smart",x, fixed=TRUE)
    coolvector <- c(a,b,c,d,e,f)
    return(sum(coolvector, na.rm=TRUE))
                    }
  sheetsdata |>
    select(AnakasticPdAssociationsCheckbox) |>
    rowwise() |> mutate(AnakasticPdAssociationsCheckbox = AnakasticPdAssociationsCheckbox %>% rule(.))
}
updateModedPDTraits <- function(){
  rule <- function(x){#The values for this one are difficult, these will be decided post interviews
    a <- grepl("Impairment in interpersonal relationships",x, fixed=TRUE)
    b <- grepl("Tendency towards manipulative behaviour, conscious or not",x, fixed=TRUE)
    c <- grepl("Impairment in emotional stability and self-regulation, suppressive or overt",x,fixed=TRUE)
    d <- grepl("Aggressive tenendies",x, fixed=TRUE)
    e <- grepl("Passive tendencies",x, fixed=TRUE)
    f <- grepl("Unusual stubbornness of beliefs",x, fixed=TRUE)
    g <- grepl("Unusual weakness of beliefs",x, fixed=TRUE)
    h <- (-9)*as.numeric(grepl("None of the above",x, fixed=TRUE))
    coolvector <- c(a,b,c,d,e,f,g,h)
    return(sum(coolvector, na.rm=TRUE))
}
  sheetsdata |>
    select(PDTraitsCheckbox) |>
    rowwise() |> mutate(PDTraitsCheckbox = PDTraitsCheckbox %>% rule(.))
}

updateModedBipolarRecognition <- function(){
  sheetsdata |>
    select(BipolarRecognition) |>
    mutate(
      BipolarRecognition = BipolarRecognition |> replace_values(
        "A) Bipolar Disorder" ~ "1",
        "B) A Personality Disorder" ~ "0",
        "C) A Neurological Disorder" ~ "0",
        "D) None of the above" ~ "0"
      ) |> as.numeric()
    )
}
updateModedBPDRecognition <- function(){
  sheetsdata |>
    select(BPDRecognition) |>
    mutate(
      BPDRecognition = BPDRecognition |> replace_values(
        "A) Borderline Personality Disorder" ~ "1",
        "B) Narcissistic Personality Disorder" ~ "0.5",
        "C) A different, or generalised, Personality Disorder" ~ "0.5",
        "D) None of the above" ~ "0"
      ) |> as.numeric()
    )
}
updateModedGeneralPDRecognition <- function(){
  sheetsdata |>
    select(GeneralPDRecognition) |>
    mutate(
      GeneralPDRecognition = GeneralPDRecognition |> replace_values(
        "A) The patient sufficiently meets the criteria for a personality disorder" ~ "1",
        "B) The patient's symptoms are due to external factors, like workplace stress" ~ "0",
        "C) The patient has suffered from a stroke prior to the development of behaviours and was left untreated" ~ "0",
        "D) The patient was brought up differently and these findings are based on their families belifs" ~ "0"
      ) |> as.numeric()
    )
}
updateModedParts <- function(){
  ModedUT <<- updateModedUT()
  ModedWFQ <<- updateModedWFQ()
  ModedPDSV <<- updateModedPDSV()
  ModedPDPV <<-updateModedPDPV()
  ModedDissNaPdAssociation <<- updateModedDissNaPdAssociation()
  ModedAnakasticPdAssociations <<- updateModedAnakasticPdAssociations()
  ModedPDTraits <<- updateModedPDTraits()
  ModedBipolarRecognition <<- updateModedBipolarRecognition()
  ModedBPDRecognition <<- updateModedBPDRecognition()
  ModedGeneralPDRecognition <<- updateModedGeneralPDRecognition()
}
updateModedPartsCompliation <- function(){
  updateModedParts()
  ModedPartsCompilation <<- bind_cols(ModedUT,ModedWFQ,ModedPDSV,ModedPDPV,ModedDissNaPdAssociation,ModedAnakasticPdAssociations,ModedPDTraits,ModedBipolarRecognition,ModedBPDRecognition,ModedGeneralPDRecognition)
}
updatekeepBetweenSheets <- function(){
  keepBetweenSheets <<- bind_cols(select(sheetsdata,Country), select(sheetsdata,Gender), sheetsdata[, !sapply(sheetsdata, is.character)])}
updateModedSheet <- function(){
  updateModedPartsCompliation()
  updatekeepBetweenSheets()
  ModedSheet <<- bind_cols(keepbBetweenSheets, ModedPartsCompilation)
}
