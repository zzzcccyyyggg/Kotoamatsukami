#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LENGTH 50

// 定义学生结构体
typedef struct Student {
    char name[MAX_NAME_LENGTH];
    int age;
    int grade;
    struct Student *next; // 用于链表结构
} Student;

// 函数声明
Student* createStudent(const char *name, int age, int grade);
void addStudent(Student **head, const char *name, int age, int grade);
void printStudents(const Student *head);
double calculateAverageGrade(const Student *head);
void saveToFile(const Student *head, const char *filename);
void freeStudentList(Student *head);

int main() {
    Student *head = NULL; // 链表头部指针
    int choice;

    while (1) {
        printf("\n--- 学生管理系统 ---\n");
        printf("1. 添加学生\n");
        printf("2. 显示所有学生信息\n");
        printf("3. 计算平均成绩\n");
        printf("4. 保存数据到文件\n");
        printf("5. 退出\n");
        printf("请选择: ");
        scanf("%d", &choice);

        if (choice == 1) {
            char name[MAX_NAME_LENGTH];
            int age, grade;
            printf("输入学生姓名: ");
            scanf("%s", name);
            printf("输入学生年龄: ");
            scanf("%d", &age);
            printf("输入学生成绩: ");
            scanf("%d", &grade);
            addStudent(&head, name, age, grade);
        } else if (choice == 2) {
            printStudents(head);
        } else if (choice == 3) {
            double average = calculateAverageGrade(head);
            if (average >= 0)
                printf("学生的平均成绩是: %.2f\n", average);
            else
                printf("没有学生信息。\n");
        } else if (choice == 4) {
            saveToFile(head, "students.txt");
            printf("数据已保存到文件 students.txt\n");
        } else if (choice == 5) {
            break;
        } else {
            printf("无效的选择，请重新输入。\n");
        }
    }

    // 释放内存
    freeStudentList(head);
    return 0;
}

// 创建一个新的学生节点
Student* createStudent(const char *name, int age, int grade) {
    Student *newStudent = (Student*)malloc(sizeof(Student));
    if (newStudent == NULL) {
        printf("内存分配失败！\n");
        exit(1);
    }
    strncpy(newStudent->name, name, MAX_NAME_LENGTH);
    newStudent->age = age;
    newStudent->grade = grade;
    newStudent->next = NULL;
    return newStudent;
}

// 添加学生到链表中
void addStudent(Student **head, const char *name, int age, int grade) {
    Student *newStudent = createStudent(name, age, grade);
    newStudent->next = *head;
    *head = newStudent;
}

// 打印所有学生信息
void printStudents(const Student *head) {
    const Student *current = head;
    if (current == NULL) {
        printf("没有学生信息。\n");
        return;
    }
    while (current != NULL) {
        printf("姓名: %s, 年龄: %d, 成绩: %d\n", current->name, current->age, current->grade);
        current = current->next;
    }
}

// 计算学生的平均成绩
double calculateAverageGrade(const Student *head) {
    const Student *current = head;
    int totalGrades = 0;
    int count = 0;

    while (current != NULL) {
        totalGrades += current->grade;
        count++;
        current = current->next;
    }

    if (count == 0) {
        return -1.0; // 如果没有学生，返回-1
    }

    return (double)totalGrades / count;
}

// 将学生数据保存到文件中
void saveToFile(const Student *head, const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("无法打开文件 %s\n", filename);
        return;
    }

    const Student *current = head;
    while (current != NULL) {
        fprintf(file, "姓名: %s, 年龄: %d, 成绩: %d\n", current->name, current->age, current->grade);
        current = current->next;
    }

    fclose(file);
}

// 释放链表内存
void freeStudentList(Student *head) {
    Student *current = head;
    while (current != NULL) {
        Student *next = current->next;
        free(current);
        current = next;
    }
}
