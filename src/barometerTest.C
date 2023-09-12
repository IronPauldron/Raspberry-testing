#include <iostream>

#include <chrono>

typedef uint32_t indexType;

std::chrono::microseconds coutPerformance(const indexType iMax)
{
    auto start = std::chrono::high_resolution_clock::now();
    for (unsigned i = 0; i < iMax; i++)
    {
        std::cout << i << std::endl;
    }
    auto stop = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);

    return duration;
}

std::chrono::microseconds printfPerformance(const indexType iMax)
{
    auto start = std::chrono::high_resolution_clock::now();
    for (unsigned i = 0; i < iMax; i++)
    {
        printf("%u\n", i);
    }
    auto stop = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);

    return duration;
}

int main()
{
    const indexType iMax = 1000000;

    const std::chrono::microseconds printfDuration = printfPerformance(iMax);

    const std::chrono::microseconds coutDuration = coutPerformance(iMax);

    std::cout << "coutDuration = " << coutDuration.count() << " microseconds" << std::endl;
    std::cout << "printfDuration = " << printfDuration.count() << " microseconds" << std::endl;

    return 0;
}