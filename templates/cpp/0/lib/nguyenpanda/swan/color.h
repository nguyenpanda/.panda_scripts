//
// Created by Hà Tường Nguyên on 10/4/24.
//

#ifndef NGUYENPANDA_CPP_COLOR_H
#define NGUYENPANDA_CPP_COLOR_H

#include <iostream>
#include <map>
#include <ctime>
#include <random>

namespace nguyenpanda::swan {

    class BaseColor {
    public:
        std::string reset;
    protected:
        bool is_foreground;
        int seed;
        std::string ansi;
        mutable std::mt19937 mt;

    public:
        explicit BaseColor(bool is_foreground);

        explicit BaseColor(int seed, bool is_foreground);

        [[nodiscard]] std::string operator()(char color) const;

        [[nodiscard]] std::string operator()(std::string color) const;

        [[nodiscard]] virtual std::string operator[](char color) const = 0;

        [[nodiscard]] virtual std::string operator[](std::string color) const = 0;

        [[nodiscard]] virtual std::string random() const = 0;
    };

    class FourBitColor : public BaseColor {
    protected:
        bool is_bright;
        static std::map<char, char> COLOR_KEYS;

    public:
        explicit FourBitColor(bool is_foreground = true, bool is_bright = true);

        explicit FourBitColor(int seed, bool is_foreground = true, bool is_bright = true);

        [[nodiscard]] std::string operator[](char color) const override;

        [[nodiscard]] std::string operator[](std::string color) const override;

        [[nodiscard]] std::string random() const override;
    };

} // namespace nguyenpanda::swan

#endif //NGUYENPANDA_CPP_COLOR_H
