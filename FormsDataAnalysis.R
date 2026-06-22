library(metricminer)

#form_url <- "https://docs.google.com/forms/d/1pPj2aLG7cvf77rKW6d2sEmTrvdJFalXZSVVleWkBb5M/edit"
#form_id <- get_google_form(form_url)
#class(form_id)
#answerframe <- as.data.frame(form_id[3])
#answerframe <- answerframe[!duplicated(answerframe),]

socialmedia1 <- function(x){ #This is coding the different responses to the "How long do you use X social media" question as the minimum numbers, exluding less than 1
    if(x=="Dont Use"){
        return(0)
    }
    if(x=="Less than 1 hour"){
        return(0.5) #The reason for this is to eliminate the overlap with "Dont Use"
    }
    if(x=="Less than 3 hours"){
        return(1)
    }
    if(x=="Less than 5 hours"){
        return(3)
    }
    if(x=="Less than 7 hours"){
        return(5)
    }
    if(x=="Less than 9 hours"){
        return(7)
    }
    if(x=="Less than 10 hours"){
        return(9)
    }
    if(x=="Atleast 10 hours"){
        return(10)
    }
    if(x=="NA"){
        return(NULL)
    }
}
socialmedia2 <- function(x){ #This is coding the different responses to the "How often do you watch" question as numbers
    if(x=="Haven't Seen"){
        return(0)
    }
    if(x=="Have been recomended but havent seen"){
        return(1)    
    }    
    if(x=="Have seen"){
        return(2)
    }
    if(x=="Watch Occasionally"){
        return(3)
    }
    if(x=="Watch frequently"){
        return(4)
    }
    if(x=="NA"){
        return(NULL)
    }    
}
socialmedia6 <- function(x){#This one is scoring the "how often do you watch from credible source" question
    if(x=="Always"){
        return(5)
    }
    if(x=="Often"){
        return(4)
    }
    if(x=="Sometimes"){
        return(3)
    }
    if(x=="Rarely"){
        return(2)
    }
    if(x=="Never"){
        return(1)
    }
    if(x=="Dont Know"){
        return(0)
    }
    if(x=="NA"){
        return(NULL)
    }    
}
#Below is a choice grid coversion for the associations section. 
choicegridconversion <- function(x){ #This is coding the different likert-like grid responses from the multipule choice grids into number format
    if(x=="Strongly Negative" || x=="Fully Disagree"){
        return(-2) #Ive gone with a negative to positive scale here to represenet that the beleifs are directed. They arent incremental 0 to n but on a continum -a to a
    }
    if(x=="Somewhat Negative" || x=="Slightly Disagree"){
        return(-1)
    }
    if(x=="Neutral/No Opinion" || x=="Neutral"){
        return(0)
    }
    if(x=="Somewhat Positive" || x=="Slightly Agree"){
        return(1)
    }
    if(x=="Strongly Positive" || x=="Fully Agree"){
        return(2)
    }
    if(x=="Mixed/Unsure" || x=="Mixed"){ #This value is annoying, it doesnt fit into a typical number schema. And it is meaningfully different from Neutral
        return(NULL)
    }
    if(x=="NA"){
        return(NULL)
    }
}
**## Not run:**
associations3 <- function(x){#The values for this one are difficult, these will be decided post interviews
    if(x=="More Likely to do drugs"){
        return()
    }
    if(x=="More Violent"){
        return()
    }
    if(x=="Are able to self manage without therapy"){
        return()
    }
    if(x=="Complete tasks at a higher quality than others"){
        return()
    }
    if(x=="Are more book smart"){
        return()
    }
    if(x=="Are less street smart"){
        return()
    }
    if(x=="NA"){
        return(NULL)
    }       
}
## End(**Not run**)

definitions3 <- function(x){
    if(x=="Impairment in interpersonal relationships"){
        return(1)
    }
    if(x=="Tendency towards manipulative behaviour, conscious or not"){
        return(1)
    }
    if(x=="Impairment in emotional stability and self-regulation, suppressive or overt"){
        return(1)
    }
    if(x=="Impairment in understanding of social norms"){
        return(1)
    }
    if(x=="Aggressive tenendies"){
        return(1)
    }
    if(x=="Passive tendencies"){
        return(1)
    }
    if(x=="Unusual stubbornness of beliefs"){
        return(1)
    }
    if(x=="Unusual weakness of beliefs"){
        return(1)
    }
    if(x=="None of the above"){
        return(-8)
    }
    if(x=="NA"){
        return(NULL)
    }   
}


#The below are codings for the multipule choice recognition questions into a bernoulli format. 
recognition4 <- function(x){
    ifelse(x=="A) Bipolar Disorder", return(1), return(0))#Uses the ifelse function to quickly encode it. 
}
recognition2 <- function(x){
    ifelse(x=="A) Borderline Personality Disorder",return(1),return(0)) 
}
recognition5 <- function(x){
    ifelse(x=="A) The patient sufficiently meets the criteria for a personality disorder", return(1), return(0))
}
