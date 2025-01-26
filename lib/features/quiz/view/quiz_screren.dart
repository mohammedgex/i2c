import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/quiz/controller/question_data_get_controller.dart';

class QuizScreen extends StatelessWidget {
  final QuizQuestionDataController quizController = Get.put(QuizQuestionDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Obx(() {
        if (quizController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (quizController.quizData.value == null) {
          return Center(child: Text("No data available"));
        }

        var quiz = quizController.quizData.value!.data.quiz;
        return ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(quiz.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...quiz.questions.map((q) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(q.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ...q.answers.map((a) => ListTile(
                          title: Text(a.title),
                          leading: Radio(value: a.id, groupValue: null, onChanged: (value) {}),
                        ))
                  ],
                ))
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => quizController.fetchQuiz(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
