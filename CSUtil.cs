using Godot;
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

public partial class CSUtil : Node
{

    // Imports
    [DllImport("user32.dll")]
    private static extern IntPtr GetForegroundWindow();

	[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    private static extern int GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);

	[DllImport("user32.dll")]
	static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

	public int getCurrentWindow(){
        IntPtr hwnd = GetForegroundWindow();

		// If no window is focused
        if (hwnd == IntPtr.Zero)
        {
            return 0;
        }


		// Get window info
        uint pid = 0;
        GetWindowThreadProcessId(hwnd, out pid);
		
		return (int)pid;
	}

	public String nameFromPID(int pid){
		try{
			Process p = Process.GetProcessById(pid);
			return p.ProcessName;
        }
        catch (ArgumentException)
        {
            return null;
        }
	}


	public bool killFromPID(int pid){
		try {
			Process p = Process.GetProcessById(pid);

			p.Kill();
			return true;
		}catch{
			return false;
		}
	}

	public void hideFromHandle(int handle){
		ShowWindow((IntPtr)handle, 0);
	}
}