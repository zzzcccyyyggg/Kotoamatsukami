#ifndef LOG_HPP
#define LOG_HPP
#pragma once

/* Define Some Color For Output */
#define RESET   "\x1B[0m"
#define RED     "\x1B[31m"
#define GREEN   "\x1B[32m"
#define YELLOW  "\x1B[33m"
#define BLUE    "\x1B[34m"

#include <iostream>
#include <string>
#include <cstdarg>

// Variadic template function for printing
template <typename... Args>
void PrintMessage(const std::string& prefix, const std::string& color, Args&&... args) {
    std::cout << color << prefix;
    (std::cout << ... << std::forward<Args>(args)); // Fold expression to expand args
    std::cout << RESET << std::endl;
}

template <typename... Args>
void PrintError(Args&&... error) {
    PrintMessage("[Kotoamatsukami] Error: ", RED, std::forward<Args>(error)...);
}

template <typename... Args>
void PrintWarning(Args&&... warning) {
    PrintMessage("[Kotoamatsukami] Warning: ", YELLOW, std::forward<Args>(warning)...);
}

template <typename... Args>
void PrintInfo(Args&&... info) {
    PrintMessage("[Kotoamatsukami] Info: ", BLUE, std::forward<Args>(info)...);
}

template <typename... Args>
void PrintSuccess(Args&&... success) {
    PrintMessage("[Kotoamatsukami] Success: ", GREEN, std::forward<Args>(success)...);
}

void PrintZZZCCC();

#endif // AUXILIARY_HPP
