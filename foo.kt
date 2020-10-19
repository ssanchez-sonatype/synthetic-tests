fun main() {
        try {
                println("Bug")
        } catch (e1: Exception) {
                throw RuntimeException(e) // Unexpected!
        }
}
