@Controller
public class LoginController {

  @GetMapping("/")
  public String login() {
    return "login";
  }

  @PostMapping("/login")
  @ResponseBody
  public String authenticate(@RequestParam String username,
                              @RequestParam String password) {
    return "Login successful for " + username;
  }
}