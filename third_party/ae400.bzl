"""
Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 * Neither the name of NVIDIA CORPORATION nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"""

load("@com_nvidia_isaac_engine//bzl:deps.bzl", "isaac_http_archive")
load("@com_nvidia_isaac_engine//bzl:deps.bzl", "isaac_new_git_repository", "isaac_new_local_repository")

def clean_dep(dep):
    return str(Label(dep))

# load lib dependencies for realsense and nvidia isaac
def ae400_workspace():
    isaac_http_archive(
        name = "com_google_absl",
        sha256 = "c8ba586a9ab12bc4a67bb419fc0d2146200942b072bac95f50490f977b7fb04f",
        strip_prefix = "abseil-cpp-5441bbe1db5d0f2ca24b5b60166367b0966790af",
        urls = ["https://github.com/abseil/abseil-cpp/archive/5441bbe1db5d0f2ca24b5b60166367b0966790af.tar.gz"],
        licenses = ["@com_google_absl//:COPYRIGHT"],
    )

    isaac_new_git_repository(
        name = "ae400_realsense_sdk",
        remote = "https://github.com/lips-hci/ae400-realsense-sdk.git",
        tag = "AE400_rs2.43.0_v1.0.2.0",
        build_file = clean_dep("//third_party:ae400.BUILD"),
        licenses = ["@ae400_realsense_sdk//:LICENSE"],
    )

