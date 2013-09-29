import java.math.BigInteger;

/**
 * Prints the sum of the digits of the number 2^1000. This answers Euler
 * problem 16, and verifies the result produced by the corresponding J code.
 */
class PowerDigitSum {
    public static void main(String[] args) {
        BigInteger r = new BigInteger("2").pow(1000);
        int sum = 0;
        for (char c : r.toString().toCharArray()) {
            sum += (int) (c - '0');
        }
        System.out.println(sum);
    }
}
