<script>

import RedirectPage from '@/components/RedirectPage.vue';
import axios from 'axios';

export default {
    components: {
        RedirectPage
    },
    data() {
        return {
            quizData: null,
            topics: [],
            selectedTopic: null,
            currentLevel: null,
            currentQuestionIndex: 0,
            currentQuestion: null,
            currentOptions: [],
            userAnswers: {},
            userAnswer: null,
            showResults: false,
            score: 0,
            username: null
        };
    },
    methods: {
        redirectToLogin() {
            window.location.href = 'http://localhost:5173/';
        },

        fetchUserInfo() {
            console.log('getuserinfo')
            fetch('http://localhost:8000/getUserInfo.php', {
                method: 'GET',
                credentials: 'include'
            })
                .then(response => response.json())
                .then(data => {
                    this.username = data.username;
                    this.email = data.email;
                }).catch(error => {
                    console.log("Error fetching user info", error);
                })
        },
        loadTopics() {
            axios.get('http://localhost:8000/topics.php')
                .then(response => {
                    this.topics = response.data;
                })
                .catch(error => {
                    console.error("Error loading topics:", error);
                });
        },
        selectTopic(topicId) {
            console.log(topicId)
            this.selectedTopic = topicId;
            this.loadQuiz();
        },
        loadQuiz() {
            axios.get('http://localhost:8000/questions.php', {
                params: {
                    topic: this.selectedTopic
                }
            })
                .then(response => {
                    this.quizData = response.data;
                    this.startQuiz();
                })
                .catch(error => {
                    console.error("Error loading quiz:", error);
                });
        },
        startQuiz() {
            this.currentLevel = 'Beginner';
            this.currentQuestionIndex = 0;
            this.loadQuestion();
        },
        loadQuestion() {
            const levelData = this.quizData[this.currentLevel];
            if (levelData && this.currentQuestionIndex < levelData.length) {
                this.currentQuestion = levelData[this.currentQuestionIndex];
                this.currentOptions = this.currentQuestion.answers;
                this.userAnswer = this.userAnswers[this.currentQuestion.id] || null;
            } else {
                this.moveToNextLevel();
            }
        },
        handleAnswer(answerId) {
            this.userAnswers[this.currentQuestion.id] = answerId;
            this.userAnswer = answerId;
        },
        nextQuestion() {
            this.currentQuestionIndex++;
            this.loadQuestion();
        },

        previousQuestion() {
            if (this.currentQuestionIndex > 0) {
                this.currentQuestionIndex--;
                this.loadQuestion();
            }
        },
        moveToNextLevel() {
            const levels = Object.keys(this.quizData);
            const currentIndex = levels.indexOf(this.currentLevel);

            if (currentIndex < levels.length - 1) {
                this.currentLevel = levels[currentIndex + 1];
                this.currentQuestionIndex = 0;
                this.loadQuestion();
            } else {
                this.submitAnswers();
            }
        },
        submitAnswers() {
            console.log(this.userAnswers)
            axios.post('http://localhost:8000/submit.php', { answers: this.userAnswers })
                .then(response => {
                    this.score = response.data.score;
                    this.showResults = true;
                })
                .catch(error => {
                    console.error("Error submitting answers:", error);
                });
        },
        resetQuiz() {
            this.showResults = false;
            this.currentQuestion = null;
            this.selectedTopic = null;
            this.userAnswers = {};
            this.loadTopics();
        },
        handleLogout() {
            console.log("logout");


            axios.post('http://localhost:8000/logout.php', {
                logout: true
            }, {
                withCredentials: true,
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => {
                    console.log(response)
                    if (response) {

                        if (response.data.redirect) {
                            window.location.href = response.data.redirect;

                        }
                        //window.location.href = 'http://localhost:5173/';
                    }
                })

                .catch(error => {
                    console.error("Error logging out:", error);
                });
        }

    },
    mounted() {
        this.loadTopics();
        this.fetchUserInfo();
    }
};
</script>

<template>
    <div v-if="username">
        <div class="headerTag">
            <h1>Welcome, {{ username }} </h1>
            <div class="topic-card">
                <button @click="handleLogout">Logout</button>
            </div>
        </div>
        <div class="quiz-container">

            <div v-if="!selectedTopic" class="topic-selection">
                <h1 class="selectTopicText">Select a topic of your choice</h1>
                <div v-for="topic in topics" :key="topic.id" class="topic-card">
                    <button @click="selectTopic(topic.name)">{{ topic.name }}</button>
                </div>
            </div>


            <div v-if="currentQuestion">
                <div class="question-card">

                    <div class="question-text">
                        <p>{{ currentQuestion.question }}</p>
                    </div>
                    <div class="options-container">
                        <div v-for="option in currentOptions" :key="option.answer_id"
                            @click="handleAnswer(option.answer_id)" class="option-card">

                            <input type="radio" :id="'option-' + option.answer_id" :value="option.answer_id"
                                v-model="userAnswer" />
                            <label :for="'option-' + option.answer_id">{{ option.answer }}</label>
                        </div>
                    </div>
                </div>
                <div class="navigation-buttons">
                    <button class="nav-button" @click="previousQuestion" :disabled="currentQuestionIndex === 0">Back</button>
                    <button class="nav-button" @click="nextQuestion" :disabled="!userAnswer">
                        {{ currentQuestionIndex >= (quizData[currentLevel].length - 1) ? 'Submit' : 'Next' }}
                    </button>

                </div>


            </div>


            <div v-if="showResults" class="modal-overlay">
                <div class="modal-content">
                    <h2>Your Results</h2>
                    <p>Your score is: {{ score }}</p>
                    <button @click="resetQuiz">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div v-else>
        <RedirectPage />
    </div>
</template>



<style scoped>
.quiz-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    font-family: Arial, sans-serif;
}

.topic-selection {
    text-align: center;
    margin-bottom: 20px;
}

.topic-card {
    margin-bottom: 10px;
}

.topic-card button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}

.question-card {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 600px;
    min-height: 150px;
    margin: 20px 0;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;

}

.question-text {
    margin-bottom: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    max-height: 60px;

}

.options-container {
    display: flex;
    flex-direction: column;
}

.option-card {
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 10px;
    padding: 10px;
    display: flex;
    align-items: center;
}

.option-card input {
    margin-right: 10px;
}

.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal-content {
    background: #fff;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    width: 400px;
}

.modal-content button {
    margin-top: 20px;
}

.option-card input[type="radio"] {
    margin-right: 10px;

}

.option-card input[type="radio"]:checked+label {
    color: #007bff;

}

.option-card label {
    display: inline-block;
    vertical-align: middle;

}

.nav-button{
    background-color: green;
    color: white;
    border: none;
    border-radius: 5px;
}

.nav-button:hover {
    background-color: darkgreen;
}

.nav-button:disabled {
    background-color: green; 
    color: darkgray; 
    cursor: not-allowed; 
    opacity: 0.6; 
}

.navigation-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.navigation-buttons button {
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
}
</style>
